Return-Path: <virtio-comment-return-5969-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF545C77B7A
	for <virtio-comment@archiver.kernel.org>; Thu, 18 May 2023 16:53:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F14F42B040
	for <virtio-comment@archiver.kernel.org>; Thu, 18 May 2023 16:53:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DE3C2986717
	for <virtio-comment@archiver.kernel.org>; Thu, 18 May 2023 16:53:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CAEF098670A; Thu, 18 May 2023 16:53:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B67B598670C
	for <virtio-comment@lists.oasis-open.org>; Thu, 18 May 2023 16:53:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684428832; x=1687020832;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XgSoPRm9oP3k3EA+c+pjYjGhjDAJTeTXRA8i6/fvbOo=;
        b=IUiXTfcGxEf+9kZfnexH/lX68ajuIftQf4GL7aX5gmpnMIrXtpUv4VxcCDqG2i6sHh
         v0g63kZAg8+hWv7vWdJ0QkHv67SKMoOdOMHvx5zdoT8uijm5l61dSUyoILEpDPSj5FQa
         bPaMmhtlqhCGLTFS4Z9ELLM2kNKRDI0v2cTF+FYpqbHVot5Q8UHfFYG2tUvUgL2oYwHI
         H49tOAi5tjDSSb/NZknf6BqxajiVybTEpA2F4QGEYgpnCUZfry3rxB76+8pasl646GGn
         k+Mo/FPChA81RaMEeKVKAC7bJbqaCZcCzMLYBryBSxwYPdfGfZRmBKUoJOWLHi7n+83k
         MQZg==
X-Gm-Message-State: AC+VfDzhcM3y25pPMfPQGt8hSx+YYcaBUxUdscDOIOdsPA6S/lpdNh+j
	j1sqprY2jF3Vc0ma/q2kevsgf8S+ufxf4wGJqPDHeGI=
X-Google-Smtp-Source: ACHHUZ4z5+B9XqRF18iSJyDt2a6MnbNTjeJ4fzOe6qJwG95Uu4UAKKs8VLEydC2Tpv+hS1B7ZzQAGYFaH0eDgptkT98=
X-Received: by 2002:a05:6e02:151:b0:335:fef6:6b76 with SMTP id
 j17-20020a056e02015100b00335fef66b76mr5248152ilr.6.1684428832016; Thu, 18 May
 2023 09:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <PH0PR12MB54816668AFE3CF0F90C8F342DC7F9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CANerMUV1vCA9j6QJ+0q93VoUeUkesuv_mToK6o3iz0989OC+Fg@mail.gmail.com> <CAJaqyWf1bKrSZOLY3R2KxZxgLnJ1BH=PXzqvatBHmKQs3zgL9A@mail.gmail.com>
In-Reply-To: <CAJaqyWf1bKrSZOLY3R2KxZxgLnJ1BH=PXzqvatBHmKQs3zgL9A@mail.gmail.com>
From: Chet Ensign <chet.ensign@oasis-open.org>
Date: Thu, 18 May 2023 12:53:41 -0400
Message-ID: <CAAwgnnMgyWqm9wAU0y7DXt7TAO=TtfPuBW4omFajw=eSeYOc-g@mail.gmail.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Ariel Adam <aadam@redhat.com>, Parav Pandit <parav@nvidia.com>, 
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Content-Type: multipart/alternative; boundary="0000000000002eaddc05fbfaa61a"
Subject: Re: [virtio-comment] virtio networking collaboration meeting: call
 for agenda

--0000000000002eaddc05fbfaa61a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just a reminder everyone that you must be a TC member to participate in TC
meetings. Eugenio, Ariel, I don't see you on the roster. Let me know if you
need directions on how to set up your OASIS logins as Redhat employees.

Thanks,

/chet

On Thu, May 18, 2023 at 5:33=E2=80=AFAM Eugenio Perez Martin <eperezma@redh=
at.com>
wrote:

> On Thu, May 18, 2023 at 7:48=E2=80=AFAM Ariel Adam <aadam@redhat.com> wro=
te:
> >
> > The "Virtio-networking upstream biweekly meeting" which happens on
> Wednesday's every 2 weeks (led by Eugenio and Jason) was meant to get all
> the companies interested in virtio networking together to help move thing=
s
> forward (both virtio-networking/spec and vDPA).
> >
> > See meeting notes from previous meetings:
> https://docs.google.com/document/d/1FoPi81zQmo5y20G0Yntg-eGHX14LnWc63TwR5=
7mCbs4/edit#
> >
> > Why not use that meeting and just add more topics given that a lot of
> the relevant companies already join this meeting?
> >
>
> Yes, that fits perfectly with the purpose of the meeting. And it has
> been used in the past to discuss AQ if I recall correctly.
>
> The shared document is already open for writing so everybody can
> propose new topics.
>
> Thanks for bringing it to the discussion!
>
> > Thanks.
> >
> > On Thu, May 18, 2023 at 3:54=E2=80=AFAM Parav Pandit <parav@nvidia.com>=
 wrote:
> >>
> >> Hi all,
> >>
> >> At the moment to my knowledge, many TC members are working on many new
> features for virtio network device specification - all of us working in
> parallel.
> >>
> >> I feel a biweekly meeting would help us virtio networking developers
> collaborate more effectively.
> >> For example, we can discuss how do features each one is working on
> interact, what timeframe is each one targeting, etc.
> >>
> >> I suggest:
> >> - A biweekly meeting using google meet.
> >> - Meeting agenda will be posted on list before a week so people
> >>   will have a full week to review, respond on the existing mailing
> lists.
> >> - If no agenda items for that meeting day, meeting will be cancelled.
> >> - Minutes will be posted on list after a meeting.
> >> - non-TC members can also join; this is an additional space to get inp=
ut
> >>   from outside experts, under the existing terms of OASIS feedback
> license.
> >>
> >> - All decisions are still made by TC electronic ballot as usual.
> Proposed collaboration
> >>   meetings are unrelated to TC ballot. The point is ability to
> collaborate,
> >>   plan and split work better between developers working in the same
> spec area.
> >>
> >> For the first meeting, I propose the following agenda item:
> >> - discuss new virtio net device features for 1.4 spec release
> >>
> >> I suggest several day & time slots.
> >> Days:
> >> - Tue (May 30) or
> >> - Wed (May 31)
> >> Time:
> >> - 2 pm GMT, or
> >> - 5 am GMT
> >>
> >> We can pick other time/day options as well depending on who wants to
> attend and in which time zone.
> >>
> >> If all this sounds interesting to you, if you would like to attend thi=
s
> and hopefully future collaboration meetings,
> >> please reply with email, cc to list:
> >> a. preferred time slots that work for you.
> >> b. any items you would like to add to above agenda.
> >>
> >> Any other comments, suggestions?
> >>
> >> Regards,
> >> Parav Pandit
> >>
> >> This publicly archived list offers a means to provide input to the
> >> OASIS Virtual I/O Device (VIRTIO) TC.
> >>
> >> In order to verify user consent to the Feedback License terms and
> >> to minimize spam in the list archive, subscription is required
> >> before posting.
> >>
> >> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> >> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> >> List help: virtio-comment-help@lists.oasis-open.org
> >> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> >> Feedback License:
> https://www.oasis-open.org/who/ipr/feedback_license.pdf
> >> List Guidelines:
> https://www.oasis-open.org/policies-guidelines/mailing-lists
> >> Committee: https://www.oasis-open.org/committees/virtio/
> >> Join OASIS: https://www.oasis-open.org/join/
> >>
>
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

--0000000000002eaddc05fbfaa61a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Just a reminder everyone that you must be a TC member to p=
articipate in TC meetings. Eugenio, Ariel, I don&#39;t see you on the roste=
r. Let me know if you need directions on how to set up your OASIS logins as=
 Redhat employees.=C2=A0<div><br></div><div>Thanks,=C2=A0</div><div><br></d=
iv><div>/chet=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Thu, May 18, 2023 at 5:33=E2=80=AFAM Eugenio Pe=
rez Martin &lt;<a href=3D"mailto:eperezma@redhat.com">eperezma@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 Thu, May 18, 2023 at 7:48=E2=80=AFAM Ariel Adam &lt;<a href=3D"mailto:aada=
m@redhat.com" target=3D"_blank">aadam@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The &quot;Virtio-networking upstream biweekly meeting&quot; which happ=
ens on Wednesday&#39;s every 2 weeks (led by Eugenio and Jason) was meant t=
o get all the companies interested in virtio networking together to help mo=
ve things forward (both virtio-networking/spec and vDPA).<br>
&gt;<br>
&gt; See meeting notes from previous meetings: <a href=3D"https://docs.goog=
le.com/document/d/1FoPi81zQmo5y20G0Yntg-eGHX14LnWc63TwR57mCbs4/edit#" rel=
=3D"noreferrer" target=3D"_blank">https://docs.google.com/document/d/1FoPi8=
1zQmo5y20G0Yntg-eGHX14LnWc63TwR57mCbs4/edit#</a><br>
&gt;<br>
&gt; Why not use that meeting and just add more topics given that a lot of =
the relevant companies already join this meeting?<br>
&gt;<br>
<br>
Yes, that fits perfectly with the purpose of the meeting. And it has<br>
been used in the past to discuss AQ if I recall correctly.<br>
<br>
The shared document is already open for writing so everybody can<br>
propose new topics.<br>
<br>
Thanks for bringing it to the discussion!<br>
<br>
&gt; Thanks.<br>
&gt;<br>
&gt; On Thu, May 18, 2023 at 3:54=E2=80=AFAM Parav Pandit &lt;<a href=3D"ma=
ilto:parav@nvidia.com" target=3D"_blank">parav@nvidia.com</a>&gt; wrote:<br=
>
&gt;&gt;<br>
&gt;&gt; Hi all,<br>
&gt;&gt;<br>
&gt;&gt; At the moment to my knowledge, many TC members are working on many=
 new features for virtio network device specification - all of us working i=
n parallel.<br>
&gt;&gt;<br>
&gt;&gt; I feel a biweekly meeting would help us virtio networking develope=
rs collaborate more effectively.<br>
&gt;&gt; For example, we can discuss how do features each one is working on=
 interact, what timeframe is each one targeting, etc.<br>
&gt;&gt;<br>
&gt;&gt; I suggest:<br>
&gt;&gt; - A biweekly meeting using google meet.<br>
&gt;&gt; - Meeting agenda will be posted on list before a week so people<br=
>
&gt;&gt;=C2=A0 =C2=A0will have a full week to review, respond on the existi=
ng mailing lists.<br>
&gt;&gt; - If no agenda items for that meeting day, meeting will be cancell=
ed.<br>
&gt;&gt; - Minutes will be posted on list after a meeting.<br>
&gt;&gt; - non-TC members can also join; this is an additional space to get=
 input<br>
&gt;&gt;=C2=A0 =C2=A0from outside experts, under the existing terms of OASI=
S feedback license.<br>
&gt;&gt;<br>
&gt;&gt; - All decisions are still made by TC electronic ballot as usual. P=
roposed collaboration<br>
&gt;&gt;=C2=A0 =C2=A0meetings are unrelated to TC ballot. The point is abil=
ity to collaborate,<br>
&gt;&gt;=C2=A0 =C2=A0plan and split work better between developers working =
in the same spec area.<br>
&gt;&gt;<br>
&gt;&gt; For the first meeting, I propose the following agenda item:<br>
&gt;&gt; - discuss new virtio net device features for 1.4 spec release<br>
&gt;&gt;<br>
&gt;&gt; I suggest several day &amp; time slots.<br>
&gt;&gt; Days:<br>
&gt;&gt; - Tue (May 30) or<br>
&gt;&gt; - Wed (May 31)<br>
&gt;&gt; Time:<br>
&gt;&gt; - 2 pm GMT, or<br>
&gt;&gt; - 5 am GMT<br>
&gt;&gt;<br>
&gt;&gt; We can pick other time/day options as well depending on who wants =
to attend and in which time zone.<br>
&gt;&gt;<br>
&gt;&gt; If all this sounds interesting to you, if you would like to attend=
 this and hopefully future collaboration meetings,<br>
&gt;&gt; please reply with email, cc to list:<br>
&gt;&gt; a. preferred time slots that work for you.<br>
&gt;&gt; b. any items you would like to add to above agenda.<br>
&gt;&gt;<br>
&gt;&gt; Any other comments, suggestions?<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Parav Pandit<br>
&gt;&gt;<br>
&gt;&gt; This publicly archived list offers a means to provide input to the=
<br>
&gt;&gt; OASIS Virtual I/O Device (VIRTIO) TC.<br>
&gt;&gt;<br>
&gt;&gt; In order to verify user consent to the Feedback License terms and<=
br>
&gt;&gt; to minimize spam in the list archive, subscription is required<br>
&gt;&gt; before posting.<br>
&gt;&gt;<br>
&gt;&gt; Subscribe: <a href=3D"mailto:virtio-comment-subscribe@lists.oasis-=
open.org" target=3D"_blank">virtio-comment-subscribe@lists.oasis-open.org</=
a><br>
&gt;&gt; Unsubscribe: <a href=3D"mailto:virtio-comment-unsubscribe@lists.oa=
sis-open.org" target=3D"_blank">virtio-comment-unsubscribe@lists.oasis-open=
.org</a><br>
&gt;&gt; List help: <a href=3D"mailto:virtio-comment-help@lists.oasis-open.=
org" target=3D"_blank">virtio-comment-help@lists.oasis-open.org</a><br>
&gt;&gt; List archive: <a href=3D"https://lists.oasis-open.org/archives/vir=
tio-comment/" rel=3D"noreferrer" target=3D"_blank">https://lists.oasis-open=
.org/archives/virtio-comment/</a><br>
&gt;&gt; Feedback License: <a href=3D"https://www.oasis-open.org/who/ipr/fe=
edback_license.pdf" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-=
open.org/who/ipr/feedback_license.pdf</a><br>
&gt;&gt; List Guidelines: <a href=3D"https://www.oasis-open.org/policies-gu=
idelines/mailing-lists" rel=3D"noreferrer" target=3D"_blank">https://www.oa=
sis-open.org/policies-guidelines/mailing-lists</a><br>
&gt;&gt; Committee: <a href=3D"https://www.oasis-open.org/committees/virtio=
/" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-open.org/committe=
es/virtio/</a><br>
&gt;&gt; Join OASIS: <a href=3D"https://www.oasis-open.org/join/" rel=3D"no=
referrer" target=3D"_blank">https://www.oasis-open.org/join/</a><br>
&gt;&gt;<br>
<br>
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

--0000000000002eaddc05fbfaa61a--
