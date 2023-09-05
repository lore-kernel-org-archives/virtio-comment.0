Return-Path: <virtio-comment-return-7256-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB83C83F33
	for <virtio-comment@archiver.kernel.org>; Tue,  5 Sep 2023 13:51:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6CF38EEA0D
	for <virtio-comment@archiver.kernel.org>; Tue,  5 Sep 2023 13:51:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 503889864AF
	for <virtio-comment@archiver.kernel.org>; Tue,  5 Sep 2023 13:51:42 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 38F34986410; Tue,  5 Sep 2023 13:51:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 28553986412
	for <virtio-comment@lists.oasis-open.org>; Tue,  5 Sep 2023 13:51:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693921901; x=1694526701;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RHnzrOLNeK637F3RYU8WApmHJrz4auLbZDKUFzakdvo=;
        b=HP49L9Egk8lcO+yvyiZvUH18ekKD9el5QYvwiuvcbXoox93GpzILrNJhVN6gAC52oh
         laPTZIPJKJoZk0kdhx/96DY9P8opb8j2aYMoZUox6G49sSL0tkeQBtb6pa2WbQrD7ov6
         TyDFLcGGUDhD5YJwm5IIHzA0dweWlwVVCPr0QWicAZWiNJj+cFjkWb+paR0MWnvuMagV
         CFXLUtzHqZy4feCZCpWVCYOwUOHhd9zaKi9TreQYCBGfC5sKALJVzI6QWur+X8CoB2Aw
         zNjhMcL6GA2q+ejPzjlXO+NlQ4+8nmxMpuGFxgS9uHrPYOqePtuHHHpnwuAbuR0K4r//
         y2dQ==
X-Gm-Message-State: AOJu0YyA7U1ZSlJNYvat+LcRTnFVjwdGlO5qBseJYVEz2ZImyR7D+zOm
	vFCn7h+og2guxyrwQVA5MlIDjEFMkxC+g/+A/g9PwcU=
X-Google-Smtp-Source: AGHT+IFMhl0a8WxIpO/2sy2iiF5QHBOLeV0NK/haznfNfwIS7RBY/+Ef6Cgrc3wT7kXJyBSqHWqN0M/gW43dzXhtaXs=
X-Received: by 2002:a05:6e02:1071:b0:34c:b943:d170 with SMTP id
 q17-20020a056e02107100b0034cb943d170mr12955389ilj.18.1693921900814; Tue, 05
 Sep 2023 06:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAAjaMXaJb+BgKj2_Ou0ghzu-HogMSdqLH=8RJrfFrTKj2dmoqg@mail.gmail.com>
In-Reply-To: <CAAjaMXaJb+BgKj2_Ou0ghzu-HogMSdqLH=8RJrfFrTKj2dmoqg@mail.gmail.com>
From: Chet Ensign <chet.ensign@oasis-open.org>
Date: Tue, 5 Sep 2023 09:51:30 -0400
Message-ID: <CAAwgnnNQXD+94ksPV21mSa58=HGiaUi1-E5YMG=BJHj21fjUOg@mail.gmail.com>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: virtio-comment@lists.oasis-open.org
Content-Type: multipart/alternative; boundary="0000000000002cfb4c06049ceded"
Subject: Re: [virtio-comment] Expired certificate on https://docs.oasis-open.org/

--0000000000002cfb4c06049ceded
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you Manos. We are on that.

On Mon, Sep 4, 2023 at 2:05=E2=80=AFAM Manos Pitsidianakis <
manos.pitsidianakis@linaro.org> wrote:

> oasis-open.org has a valid certificate, but docs.* does not.
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines:
> https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>
>

--=20
Chet Ensign

Chief Technical Community Steward

OASIS Open

+1 201-341-1393 <+1+201-341-1393>
chet.ensign@oasis-open.org
www.oasis-open.org

--0000000000002cfb4c06049ceded
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you Manos. We are on that.=C2=A0</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 4, 2023 =
at 2:05=E2=80=AFAM Manos Pitsidianakis &lt;<a href=3D"mailto:manos.pitsidia=
nakis@linaro.org">manos.pitsidianakis@linaro.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><a href=3D"http://oasis-ope=
n.org" rel=3D"noreferrer" target=3D"_blank">oasis-open.org</a> has a valid =
certificate, but docs.* does not.<br>
<br>
This publicly archived list offers a means to provide input to the<br>
OASIS Virtual I/O Device (VIRTIO) TC.<br>
<br>
In order to verify user consent to the Feedback License terms and<br>
to minimize spam in the list archive, subscription is required<br>
before posting.<br>
<br>
Subscribe: <a href=3D"mailto:virtio-comment-subscribe@lists.oasis-open.org"=
 target=3D"_blank">virtio-comment-subscribe@lists.oasis-open.org</a><br>
Unsubscribe: <a href=3D"mailto:virtio-comment-unsubscribe@lists.oasis-open.=
org" target=3D"_blank">virtio-comment-unsubscribe@lists.oasis-open.org</a><=
br>
List help: <a href=3D"mailto:virtio-comment-help@lists.oasis-open.org" targ=
et=3D"_blank">virtio-comment-help@lists.oasis-open.org</a><br>
List archive: <a href=3D"https://lists.oasis-open.org/archives/virtio-comme=
nt/" rel=3D"noreferrer" target=3D"_blank">https://lists.oasis-open.org/arch=
ives/virtio-comment/</a><br>
Feedback License: <a href=3D"https://www.oasis-open.org/who/ipr/feedback_li=
cense.pdf" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-open.org/=
who/ipr/feedback_license.pdf</a><br>
List Guidelines: <a href=3D"https://www.oasis-open.org/policies-guidelines/=
mailing-lists" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-open.=
org/policies-guidelines/mailing-lists</a><br>
Committee: <a href=3D"https://www.oasis-open.org/committees/virtio/" rel=3D=
"noreferrer" target=3D"_blank">https://www.oasis-open.org/committees/virtio=
/</a><br>
Join OASIS: <a href=3D"https://www.oasis-open.org/join/" rel=3D"noreferrer"=
 target=3D"_blank">https://www.oasis-open.org/join/</a><br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><table cellspacing=3D"0" cellpadding=3D"0" style=3D"font-fam=
ily:Arial;vertical-align:-webkit-baseline-middle"><tbody><tr><td width=3D"7=
0" style=3D"vertical-align:middle"><span style=3D"margin-right:5px;display:=
block"><img width=3D"70" height=3D"70" style=3D"max-width: 70px;" src=3D"ht=
tps://ci3.googleusercontent.com/mail-sig/AIorK4wWWvttK4QvAyLjmQRfbisd2jdvX8=
4ncnFeBuJn9NtWvi8WHJIwVlm1HGm8Re2Ji0U6N10brtc"></span></td><td style=3D"ver=
tical-align:middle"><h3 style=3D"margin:0px;font-size:16px;color:rgb(0,0,0)=
">Chet=C2=A0Ensign</h3><p style=3D"margin:0px;color:rgb(0,0,0);font-size:12=
px;line-height:20px">Chief Technical Community Steward</p><p style=3D"margi=
n:0px;color:rgb(0,0,0);font-size:12px;line-height:20px">OASIS Open</p></td>=
<td width=3D"30">=C2=A0</td><td width=3D"1" style=3D"width:1px;border-botto=
m:none;border-left:1px solid rgb(34,72,229)">=C2=A0</td><td width=3D"30">=
=C2=A0</td><td style=3D"vertical-align:middle"><table cellspacing=3D"0" cel=
lpadding=3D"0" style=3D"vertical-align:-webkit-baseline-middle;font-family:=
Arial"><tbody><tr style=3D"vertical-align:middle"><td width=3D"30" style=3D=
"vertical-align:middle"><table cellspacing=3D"0" cellpadding=3D"0" style=3D=
"vertical-align:-webkit-baseline-middle;font-family:Arial"><tbody><tr><td s=
tyle=3D"vertical-align:bottom"><span style=3D"display:block;background-colo=
r:rgb(34,72,229)"><img src=3D"https://cdn2.hubspot.net/hubfs/53/tools/email=
-signature-generator/icons/phone-icon-2x.png" width=3D"13" style=3D"display=
: block;"></span></td></tr></tbody></table></td><td style=3D"padding:2px;co=
lor:rgb(0,0,0)"><a href=3D"tel:+1+201-341-1393" style=3D"color:rgb(0,0,0);f=
ont-size:12px" target=3D"_blank">+1 201-341-1393</a></td></tr><tr style=3D"=
vertical-align:middle"><td width=3D"30" style=3D"vertical-align:middle"><ta=
ble cellspacing=3D"0" cellpadding=3D"0" style=3D"vertical-align:-webkit-bas=
eline-middle;font-family:Arial"><tbody><tr><td style=3D"vertical-align:bott=
om"><span style=3D"display:block;background-color:rgb(34,72,229)"><img src=
=3D"https://cdn2.hubspot.net/hubfs/53/tools/email-signature-generator/icons=
/email-icon-2x.png" width=3D"13" style=3D"display: block;"></span></td></tr=
></tbody></table></td><td style=3D"padding:2px"><a href=3D"mailto:chet.ensi=
gn@oasis-open.org" style=3D"color:rgb(0,0,0);font-size:12px" target=3D"_bla=
nk">chet.ensign@oasis-open.org</a></td></tr><tr style=3D"vertical-align:mid=
dle"><td width=3D"30" style=3D"vertical-align:middle"><table cellspacing=3D=
"0" cellpadding=3D"0" style=3D"vertical-align:-webkit-baseline-middle;font-=
family:Arial"><tbody><tr><td style=3D"vertical-align:bottom"><span style=3D=
"display:block;background-color:rgb(34,72,229)"><img src=3D"https://cdn2.hu=
bspot.net/hubfs/53/tools/email-signature-generator/icons/link-icon-2x.png" =
width=3D"13" style=3D"display: block;"></span></td></tr></tbody></table></t=
d><td style=3D"padding:2px"><a href=3D"https://www.oasis-open.org" style=3D=
"color:rgb(0,0,0);font-size:12px" target=3D"_blank">www.oasis-open.org</a><=
/td></tr></tbody></table></td></tr></tbody></table></div></div>

--0000000000002cfb4c06049ceded--
