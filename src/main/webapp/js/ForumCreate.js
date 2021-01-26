$(function(){
	$('#submitForm').attr('disabled','true');
	
    let title = false;
	let text = true;
	if($('#sTitle').val() != ''){
		title = true;
	}
	
//	if($('#sText').val() != ''){
//		text = true;
//	}
    $('#sTitle').blur(function(){
		let regu = '^[ ]+$';
   	    let re = new RegExp(regu);
        if($(this).val() == '' || re.test($(this).val())){
            $('#titleError').text('標題不能空白');
            title = false;
        }else if($(this).val().length > 50){
			$('#titleError').text('標題限制50字以內');
            title = false;
		}else{
            $('#titleError').empty();
            title = true;
        }
        check();
    });

//	$('#sText').on('blur',function(){
//		let regu = '^[ ]+$';
//   	    let re = new RegExp(regu);
//        if($(this).val() == '' || re.test($(this).val())){
//            $('#textError').text('內文不能空白');
//            text = false;
//		}else{
//            $('#textError').empty();
//            text = true;
//        }
//        check();
//	});

	check();
    function check(){
        if(title && text){
            $('#submitForm').removeAttr('disabled');
        }else{
            $('#submitForm').attr('disabled','true');
        }
    }

	let editor = CKEDITOR.replace('sText');
	$('#oneKey').on('click', function(){
		$('#sCategory').val('情報');
		$('#sTitle').val('《魔物獵人 崛起》揭露全新系統「操龍」 確認體驗版本週五起限期開放遊玩');
		
		editor.setData("<div>CAPCOM 製作，預定 2021 年 3 月 26 日（五）推出的 Nintendo Switch 狩獵動作遊戲《<a href='https://acg.gamer.com.tw/search.php?encode=utf8&amp;kw=%E9%AD%94%E7%89%A9%E7%8D%B5%E4%BA%BA+%E5%B4%9B%E8%B5%B7' target='_blank'>魔物獵人 崛起</a>（Monster Hunter Rise）》，今（７）日釋出最新宣傳介紹影片，確認體驗版將於本週五起限時開放遊玩。</div>"
						+"<div>&nbsp;</div><div><div><div><iframe allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen='' frameborder='0' height='315' src='https://www.youtube.com/embed/6X71AKrtTYg' width='560'></iframe></div>"
						+"</div><div>&nbsp;</div><div>　　在今日播出的 1 月特別節目中，製作人辻本良三帶來遊戲最新宣傳影片，介紹新狩獵舞台「寒冷群島」，登場魔物「雪鬼獸」、「冰牙龍」、「奇怪龍」、「眠狗龍王」、「白兔獸」、「轟龍」、「泡狐龍」與主題魔物「怨虎龍」，狩獵據點中提供獵人支援的形形色色角色，以及揭露能駕馭魔物戰鬥的全新系統「操龍」。</div>"
						+"<div>&nbsp;</div><div><div><div><iframe allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen='' frameborder='0' height='315' src='https://www.youtube.com/embed/H-dCASsIw-I' width='560'></iframe></div>"
						+"</div></div><div>&nbsp;</div><h2>在《<a href='https://acg.gamer.com.tw/search.php?encode=utf8&amp;kw=%E9%AD%94%E7%89%A9%E7%8D%B5%E4%BA%BA+%E5%B4%9B%E8%B5%B7' target='_blank'>魔物獵人 崛起</a>》體驗版中體驗可操縱魔物、使出豪邁動作的「操龍」</h2>"
						+"<div>&nbsp;</div><div>　　「操龍」可以鐵蟲絲拘束並操縱魔物，是本作的新要素。</div><div>　　可以把本應是獵人的威脅的魔物加以利用，體驗豪邁的動作！</div>"
						+"<div>&nbsp;</div><ul><li>透過使出特定攻擊等方式，可伺機進行「操龍」，於一定時間內操縱魔物！</li><li>操龍期間，可操縱狂暴失控的魔物，使出豪邁的動作！</li><li>透過攻擊其他魔物累積「操龍計量表」，從而使出強勁的「操龍必殺技」！</li>"
						+"</ul><div>&nbsp;</div><div><div>&nbsp;</div><div><div><a href='javascript:;' tabindex='0'><img data-sizes='auto' data-src='https://p2.bahamut.com.tw/B/2KU/63/372434b9aaf7012396fe5bf2431b4kr5.JPG' data-srcset='https://p2.bahamut.com.tw/B/2KU/63/372434b9aaf7012396fe5bf2431b4kr5.JPG?w=1000 1x,https://p2.bahamut.com.tw/B/2KU/63/372434b9aaf7012396fe5bf2431b4kr5.JPG 2x' sizes='774px' src='https://p2.bahamut.com.tw/B/2KU/63/372434b9aaf7012396fe5bf2431b4kr5.JPG' srcset='https://p2.bahamut.com.tw/B/2KU/63/372434b9aaf7012396fe5bf2431b4kr5.JPG?w=1000 1x,https://p2.bahamut.com.tw/B/2KU/63/372434b9aaf7012396fe5bf2431b4kr5.JPG 2x' /></a></div>"
						+"</div><div><div><a href='javascript:;' tabindex='-1'><img data-sizes='auto' data-src='https://p2.bahamut.com.tw/B/2KU/64/e6653e26a2d71bae0d7ec068af1b4ks5.JPG' data-srcset='https://p2.bahamut.com.tw/B/2KU/64/e6653e26a2d71bae0d7ec068af1b4ks5.JPG?w=1000 1x,https://p2.bahamut.com.tw/B/2KU/64/e6653e26a2d71bae0d7ec068af1b4ks5.JPG 2x' sizes='774px' src='https://p2.bahamut.com.tw/B/2KU/64/e6653e26a2d71bae0d7ec068af1b4ks5.JPG' srcset='https://p2.bahamut.com.tw/B/2KU/64/e6653e26a2d71bae0d7ec068af1b4ks5.JPG?w=1000 1x,https://p2.bahamut.com.tw/B/2KU/64/e6653e26a2d71bae0d7ec068af1b4ks5.JPG 2x' /></a></div>"
						+"</div><div>&nbsp;</div></div><div>&nbsp;</div></div>");
		$('#submitForm').removeAttr('disabled');
	});

});