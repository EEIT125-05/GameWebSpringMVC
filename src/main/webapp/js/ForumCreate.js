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
		
		editor.setData("<div>CAPCOM 製作，預定 2021 年 3 月 26 日（五）推出的 Nintendo Switch 狩獵動作遊戲《<a href='https://acg.gamer.com.tw/search.php?encode=utf8&amp;kw=%E9%AD%94%E7%89%A9%E7%8D%B5%E4%BA%BA+%E5%B4%9B%E8%B5%B7' target='_blank'>魔物獵人 崛起</a>（Monster Hunter Rise）》，今（７）日釋出最新宣傳介紹影片，確認體驗版將於本週五起限時開放遊玩。</div><div>&nbsp;</div><div><div><div><iframe allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen='' frameborder='0' height='315' src='https://www.youtube.com/embed/6X71AKrtTYg' width='560'></iframe></div></di></div>"
						+"<div>&nbsp;</div><div>　　在今日播出的 1 月特別節目中，製作人辻本良三帶來遊戲最新宣傳影片，介紹新狩獵舞台「寒冷群島」，登場魔物「雪鬼獸」、「冰牙龍」、「奇怪龍」、「眠狗龍王」、「白兔獸」、「轟龍」、「泡狐龍」與主題魔物「怨虎龍」，狩獵據點中提供獵人支援的形形色色角色，以及揭露能駕馭魔物戰鬥的全新系統「操龍」。</div>"
						+"<div>&nbsp;</div><div><div><div><iframe allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen='' frameborder='0' height='315' src='https://www.youtube.com/embed/H-dCASsIw-I' width='560'></iframe></div>"
						+"</div></div><div>&nbsp;</div><div>　　官方同時確認《<a href='http://acg.gamer.com.tw/search.php?encode=utf8&amp;kw=%E9%AD%94%E7%89%A9%E7%8D%B5%E4%BA%BA%20%E5%B4%9B%E8%B5%B7' target='_blank'>魔物獵人 崛起</a>》體驗版將於 1 月 8 日（五）至 2 月 1 日（一）限時開放下載遊玩。收錄討伐鐮鼬龍王的「新手的任務」與討伐泡狐龍的「高手的任務」兩種難度的任務。開放全部 14 種武器，以及隨從加爾克與隨從艾路等支援要素。狩獵舞台為可以體驗捕捉翔蟲與環境生物來強化狀態的「大社遺跡」。</div>"
						+"<div>&nbsp;</div><div>　　此外還收錄有練習基本操作的「基礎訓練任務」以及練習「操龍」的「操龍訓練任務」兩種練習模式。</div><div>&nbsp;</div><div><div><div><iframe allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen='' frameborder='0' height='437' src='https://www.youtube.com/embed/ZCe1bHOA4WI' width='776'></iframe></div>"
						+"</div></div><div>&nbsp;</div><div><div><div><iframe allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen='' frameborder='0' height='437' src='https://www.youtube.com/embed/VR69mN1ByaI' width='776'></iframe></div>"
						+"</div></div><div>&nbsp;</div><h2>《<a href='https://acg.gamer.com.tw/search.php?encode=utf8&amp;kw=%E9%AD%94%E7%89%A9%E7%8D%B5%E4%BA%BA+%E5%B4%9B%E8%B5%B7' target='_blank'>魔物獵人 崛起</a>》體驗版概要</h2><div>&nbsp;</div><div><div><div><div><div><div><a href='javascript:;' tabindex='-1'><img data-sizes='auto' data-src='https://p2.bahamut.com.tw/B/2KU/25/dbce4ec33e76287447a419d2b81b4jp5.JPG' data-srcset='https://p2.bahamut.com.tw/B/2KU/25/dbce4ec33e76287447a419d2b81b4jp5.JPG?w=1000 1x,https://p2.bahamut.com.tw/B/2KU/25/dbce4ec33e76287447a419d2b81b4jp5.JPG 2x' sizes='774px' src='https://p2.bahamut.com.tw/B/2KU/25/dbce4ec33e76287447a419d2b81b4jp5.JPG' srcset='https://p2.bahamut.com.tw/B/2KU/25/dbce4ec33e76287447a419d2b81b4jp5.JPG?w=1000 1x,https://p2.bahamut.com.tw/B/2KU/25/dbce4ec33e76287447a419d2b81b4jp5.JPG 2x' /></a></div>"
						+"</div><div><div><a href='javascript:;' tabindex='0'><img data-sizes='auto' data-src='https://p2.bahamut.com.tw/B/2KU/19/07148db4fd865826c6ce9d3b341b4jj5.JPG' data-srcset='https://p2.bahamut.com.tw/B/2KU/19/07148db4fd865826c6ce9d3b341b4jj5.JPG?w=1000 1x,https://p2.bahamut.com.tw/B/2KU/19/07148db4fd865826c6ce9d3b341b4jj5.JPG 2x' sizes='774px' src='https://p2.bahamut.com.tw/B/2KU/19/07148db4fd865826c6ce9d3b341b4jj5.JPG' srcset='https://p2.bahamut.com.tw/B/2KU/19/07148db4fd865826c6ce9d3b341b4jj5.JPG?w=1000 1x,https://p2.bahamut.com.tw/B/2KU/19/07148db4fd865826c6ce9d3b341b4jj5.JPG 2x' /></a></div>"
						+"</div><div><div><a href='javascript:;' tabindex='-1'><img data-sizes='auto' data-src='https://p2.bahamut.com.tw/B/2KU/20/e656406601a41a36d6ef400bb81b4jk5.JPG' data-srcset='https://p2.bahamut.com.tw/B/2KU/20/e656406601a41a36d6ef400bb81b4jk5.JPG?w=1000 1x,https://p2.bahamut.com.tw/B/2KU/20/e656406601a41a36d6ef400bb81b4jk5.JPG 2x' sizes='774px' src='https://p2.bahamut.com.tw/B/2KU/20/e656406601a41a36d6ef400bb81b4jk5.JPG' srcset='https://p2.bahamut.com.tw/B/2KU/20/e656406601a41a36d6ef400bb81b4jk5.JPG?w=1000 1x,https://p2.bahamut.com.tw/B/2KU/20/e656406601a41a36d6ef400bb81b4jk5.JPG 2x' /></a></div>"
						+"</div><div><div><a href='javascript:;' tabindex='-1'><img data-sizes='auto' data-src='https://p2.bahamut.com.tw/B/2KU/21/5890c0142518a97104be46b75f1b4jl5.JPG' data-srcset='https://p2.bahamut.com.tw/B/2KU/21/5890c0142518a97104be46b75f1b4jl5.JPG?w=1000 1x,https://p2.bahamut.com.tw/B/2KU/21/5890c0142518a97104be46b75f1b4jl5.JPG 2x' sizes='774px' src='https://p2.bahamut.com.tw/B/2KU/21/5890c0142518a97104be46b75f1b4jl5.JPG' srcset='https://p2.bahamut.com.tw/B/2KU/21/5890c0142518a97104be46b75f1b4jl5.JPG?w=1000 1x,https://p2.bahamut.com.tw/B/2KU/21/5890c0142518a97104be46b75f1b4jl5.JPG 2x' /></a></div>"
						+"</div><div><div>&nbsp;</div></div><div><div>&nbsp;</div></div></div></div></div><div>1/7</div></div><ul><li>從基本操作到正式狩獵都可體驗，共有 4 個任務登場！</li><li>可使用全部 14 種武器，除了一人遊玩外，亦可進行最多 4 人的多人遊玩！</li>	<li>此外，只要遊玩體驗版，就可於製品版中獲得道具套裝包！</li>"
						+"</ul><div>&nbsp;</div><div><strong>　發布日期：</strong>2021 年 1 月 8 日（五）～2021 年 2 月 1 日（一）16 00</div><div><strong>　所需容量：</strong>1.62GB</div><div>&nbsp;</div><div>※ 鐮鼬龍王討伐任務和泡狐龍討伐任務設有任務出發次數限制，合計<strong>僅有 30 次</strong>。<br />　如已耗盡所有任務出發次數，將無法遊玩包含基礎訓練任務和操龍訓練任務在內的共 4 種任務</div>"
						+"<div>※ 遊玩期間及條件如下：</div><div>　【一人遊玩及鄰近主機通訊下的多人遊玩】可遊玩至耗盡所有任務出發次數</div><div>　【網絡通訊遊玩下的多人遊玩】可遊玩至體驗版發布結束為止</div><div>※ 如要透過網絡通訊進行多人遊玩，需要加入 Nintendo Switch Online 付費網路服務</div><div>※ 本體驗版的內容有可能跟製品版有所不同</div>"
						+"<div>※ 本體驗版有可能因為各種因素，而在無預告的情況下更改發布日期或取消發布</div><div>&nbsp;</div><h2>在《<a href='https://acg.gamer.com.tw/search.php?encode=utf8&amp;kw=%E9%AD%94%E7%89%A9%E7%8D%B5%E4%BA%BA+%E5%B4%9B%E8%B5%B7' target='_blank'>魔物獵人 崛起</a>》體驗版中體驗可操縱魔物、使出豪邁動作的「操龍」</h2>"
						+"<div>&nbsp;</div><div><ul>	<li>&nbsp;</li></ul></div><div><img alt='image' data-sizes='auto' data-src='https://p2.bahamut.com.tw/B/2KU/07/aab8174db1a92789fbadb848d81b4j75.JPG?v=1610031621819' data-srcset='https://p2.bahamut.com.tw/B/2KU/07/aab8174db1a92789fbadb848d81b4j75.JPG?w=1000 1x,https://p2.bahamut.com.tw/B/2KU/07/aab8174db1a92789fbadb848d81b4j75.JPG 2x' name='gnnPIC' sizes='775px' src='https://p2.bahamut.com.tw/B/2KU/07/aab8174db1a92789fbadb848d81b4j75.JPG?v=1610031621819' srcset='https://p2.bahamut.com.tw/B/2KU/07/aab8174db1a92789fbadb848d81b4j75.JPG?w=1000 1x,https://p2.bahamut.com.tw/B/2KU/07/aab8174db1a92789fbadb848d81b4j75.JPG 2x' title='' /></div>"
						+"<div>&nbsp;</div><div>　　「操龍」可以鐵蟲絲拘束並操縱魔物，是本作的新要素。</div><div>　　可以把本應是獵人的威脅的魔物加以利用，體驗豪邁的動作！</div><div>&nbsp;</div><ul><li>透過使出特定攻擊等方式，可伺機進行「操龍」，於一定時間內操縱魔物！</li>	<li>操龍期間，可操縱狂暴失控的魔物，使出豪邁的動作！</li>	<li>透過攻擊其他魔物累積「操龍計量表」，從而使出強勁的「操龍必殺技」！</li>"
						+"</ul><div>&nbsp;</div><div><div><div><a href='javascript:;' tabindex='-1'><img data-sizes='auto' data-src='https://p2.bahamut.com.tw/B/2KU/68/dcadda1c7e5d92795fbe82d2901b4kw5.JPG' data-srcset='https://p2.bahamut.com.tw/B/2KU/68/dcadda1c7e5d92795fbe82d2901b4kw5.JPG?w=1000 1x,https://p2.bahamut.com.tw/B/2KU/68/dcadda1c7e5d92795fbe82d2901b4kw5.JPG 2x' sizes='774px' src='https://p2.bahamut.com.tw/B/2KU/68/dcadda1c7e5d92795fbe82d2901b4kw5.JPG' srcset='https://p2.bahamut.com.tw/B/2KU/68/dcadda1c7e5d92795fbe82d2901b4kw5.JPG?w=1000 1x,https://p2.bahamut.com.tw/B/2KU/68/dcadda1c7e5d92795fbe82d2901b4kw5.JPG 2x' /></a></div>"
						+"</div><div><div><a href='javascript:;' tabindex='0'><img data-sizes='auto' data-src='https://p2.bahamut.com.tw/B/2KU/63/372434b9aaf7012396fe5bf2431b4kr5.JPG' data-srcset='https://p2.bahamut.com.tw/B/2KU/63/372434b9aaf7012396fe5bf2431b4kr5.JPG?w=1000 1x,https://p2.bahamut.com.tw/B/2KU/63/372434b9aaf7012396fe5bf2431b4kr5.JPG 2x' sizes='774px' src='https://p2.bahamut.com.tw/B/2KU/63/372434b9aaf7012396fe5bf2431b4kr5.JPG' srcset='https://p2.bahamut.com.tw/B/2KU/63/372434b9aaf7012396fe5bf2431b4kr5.JPG?w=1000 1x,https://p2.bahamut.com.tw/B/2KU/63/372434b9aaf7012396fe5bf2431b4kr5.JPG 2x' /></a></div>"
						+"</div><div><div><a href='javascript:;' tabindex='-1'><img data-sizes='auto' data-src='https://p2.bahamut.com.tw/B/2KU/64/e6653e26a2d71bae0d7ec068af1b4ks5.JPG' data-srcset='https://p2.bahamut.com.tw/B/2KU/64/e6653e26a2d71bae0d7ec068af1b4ks5.JPG?w=1000 1x,https://p2.bahamut.com.tw/B/2KU/64/e6653e26a2d71bae0d7ec068af1b4ks5.JPG 2x' sizes='774px' src='https://p2.bahamut.com.tw/B/2KU/64/e6653e26a2d71bae0d7ec068af1b4ks5.JPG' srcset='https://p2.bahamut.com.tw/B/2KU/64/e6653e26a2d71bae0d7ec068af1b4ks5.JPG?w=1000 1x,https://p2.bahamut.com.tw/B/2KU/64/e6653e26a2d71bae0d7ec068af1b4ks5.JPG 2x' /></a></div>"
						+"</div><div><div><a href='javascript:;' tabindex='-1'><img data-sizes='auto' data-src='https://p2.bahamut.com.tw/B/2KU/65/9207ebe0a2f32e79cc4412a8181b4kt5.JPG' data-srcset='https://p2.bahamut.com.tw/B/2KU/65/9207ebe0a2f32e79cc4412a8181b4kt5.JPG?w=1000 1x,https://p2.bahamut.com.tw/B/2KU/65/9207ebe0a2f32e79cc4412a8181b4kt5.JPG 2x' sizes='774px' src='https://p2.bahamut.com.tw/B/2KU/65/9207ebe0a2f32e79cc4412a8181b4kt5.JPG' srcset='https://p2.bahamut.com.tw/B/2KU/65/9207ebe0a2f32e79cc4412a8181b4kt5.JPG?w=1000 1x,https://p2.bahamut.com.tw/B/2KU/65/9207ebe0a2f32e79cc4412a8181b4kt5.JPG 2x' /></a></div>"
						+"</div><div><div>&nbsp;</div></div><div>&nbsp;</div></div><h2>氣候極寒的新原野「寒冷群島」</h2><div>&nbsp;</div><div><ul><li>&nbsp;</li></ul></div><div><img alt='image' data-sizes='auto' data-src='https://p2.bahamut.com.tw/B/2KU/86/842efab0fc79ce9fb4160054671b4im5.JPG?v=1610031664659' data-srcset='https://p2.bahamut.com.tw/B/2KU/86/842efab0fc79ce9fb4160054671b4im5.JPG?w=1000 1x,https://p2.bahamut.com.tw/B/2KU/86/842efab0fc79ce9fb4160054671b4im5.JPG 2x' name='gnnPIC' sizes='775px' src='https://p2.bahamut.com.tw/B/2KU/86/842efab0fc79ce9fb4160054671b4im5.JPG?v=1610031664659' srcset='https://p2.bahamut.com.tw/B/2KU/86/842efab0fc79ce9fb4160054671b4im5.JPG?w=1000 1x,https://p2.bahamut.com.tw/B/2KU/86/842efab0fc79ce9fb4160054671b4im5.JPG 2x' title='' /></div>"
						+"<div>&nbsp;</div><div>　　氣候極寒的寒冷群島過去是巨龍的巢穴。傳說曾有很多強者挑戰過此巨龍，卻命喪於此。</div><div>　　群島中央的巨大龍骨和已腐朽的擊龍船如今暴露於風雪之下，訴說著過往的激戰是何等地慘烈。</div>"
						+"<div>&nbsp;</div><div><img alt='image' data-sizes='auto' data-src='https://p2.bahamut.com.tw/B/2KU/87/ed539bf19c9bf995c0360425ca1b4in5.JPG?v=1610031676642' data-srcset='https://p2.bahamut.com.tw/B/2KU/87/ed539bf19c9bf995c0360425ca1b4in5.JPG?w=500 1x,https://p2.bahamut.com.tw/B/2KU/87/ed539bf19c9bf995c0360425ca1b4in5.JPG?w=1000 2x,https://p2.bahamut.com.tw/B/2KU/87/ed539bf19c9bf995c0360425ca1b4in5.JPG?w=1500 3x,https://p2.bahamut.com.tw/B/2KU/87/ed539bf19c9bf995c0360425ca1b4in5.JPG 4x' name='gnnPIC' sizes='387px' src='https://p2.bahamut.com.tw/B/2KU/87/ed539bf19c9bf995c0360425ca1b4in5.JPG?v=1610031676642' srcset='https://p2.bahamut.com.tw/B/2KU/87/ed539bf19c9bf995c0360425ca1b4in5.JPG?w=500 1x,https://p2.bahamut.com.tw/B/2KU/87/ed539bf19c9bf995c0360425ca1b4in5.JPG?w=1000 2x,https://p2.bahamut.com.tw/B/2KU/87/ed539bf19c9bf995c0360425ca1b4in5.JPG?w=1500 3x,https://p2.bahamut.com.tw/B/2KU/87/ed539bf19c9bf995c0360425ca1b4in5.JPG 4x' title='' /></div>"
						+"<div><img alt='image' data-sizes='auto' data-src='https://p2.bahamut.com.tw/B/2KU/88/66eb22bc5d1ad3065566c6a1b21b4io5.JPG?v=1610031676642' data-srcset='https://p2.bahamut.com.tw/B/2KU/88/66eb22bc5d1ad3065566c6a1b21b4io5.JPG?w=500 1x,https://p2.bahamut.com.tw/B/2KU/88/66eb22bc5d1ad3065566c6a1b21b4io5.JPG?w=1000 2x,https://p2.bahamut.com.tw/B/2KU/88/66eb22bc5d1ad3065566c6a1b21b4io5.JPG?w=1500 3x,https://p2.bahamut.com.tw/B/2KU/88/66eb22bc5d1ad3065566c6a1b21b4io5.JPG 4x' name='gnnPIC' sizes='387px' src='https://p2.bahamut.com.tw/B/2KU/88/66eb22bc5d1ad3065566c6a1b21b4io5.JPG?v=1610031676642' srcset='https://p2.bahamut.com.tw/B/2KU/88/66eb22bc5d1ad3065566c6a1b21b4io5.JPG?w=500 1x,https://p2.bahamut.com.tw/B/2KU/88/66eb22bc5d1ad3065566c6a1b21b4io5.JPG?w=1000 2x,https://p2.bahamut.com.tw/B/2KU/88/66eb22bc5d1ad3065566c6a1b21b4io5.JPG?w=1500 3x,https://p2.bahamut.com.tw/B/2KU/88/66eb22bc5d1ad3065566c6a1b21b4io5.JPG 4x' title='' /></div>");
		$('#submitForm').removeAttr('disabled');
	});

});