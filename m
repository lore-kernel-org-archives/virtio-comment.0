Return-Path: <virtio-comment-return-5964-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A95C77B7A
	for <virtio-comment@archiver.kernel.org>; Thu, 18 May 2023 05:48:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 37D242AC4D
	for <virtio-comment@archiver.kernel.org>; Thu, 18 May 2023 05:48:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1B97B9866FC
	for <virtio-comment@archiver.kernel.org>; Thu, 18 May 2023 05:48:15 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0B2299840C0; Thu, 18 May 2023 05:48:15 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E74D89866F7
	for <virtio-comment@lists.oasis-open.org>; Thu, 18 May 2023 05:48:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: fdGGi_nsOEm-sQIrNSj9hQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684388889; x=1686980889;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mE+eQCK7q1+W6n/94xYD5INp9xkeBkGqlc0Dmc362L4=;
        b=Yi7mxRFroLvehH1yr2KHeHMAz/JUk20Y0RPkWFfsZ4NLSwp4xxoYbYqmghkD7U6Onz
         zGj4EkeWw5umiDGqo+y28riwc+9OkXqeYqR+oVY6l+e88cKfdLnSsGwehtrjLBU8/v/t
         4iU+YJSesyK0EKCdbDlZ3UcldrAEfoG7HpNVt5eJwEpc2KeKd6RL8Su6xVSZ0Cvi6ZZ0
         TNip7G0TcHPLfkvbv4S28v9jjm0v9m9YKqnaZpCD069JZOOLeVStXYiK0Uoo3cRvwhKI
         mxeHqcKAaE7ZiqJVeZ6wapFAwxMLvKyceHWLC9RXW6K6Npf8FuVSt58Xy5/DQYKswNyK
         Om+A==
X-Gm-Message-State: AC+VfDxJpEGnzDQibN7M0BjeOlWVwpxCUGrZouChoRVQKrSAFkGa5nJu
	S+q0+x3NlEGVF5l+FcL8csHI92MsifnZj5tGhTENpPlVj2z+p0jmBTHat5e5GNFVkpgcxpDLfC2
	D3dGA30FMzvhZHRhSyIXQyswtLYsthjIUCJOeHitX7lel+vO+QQ==
X-Received: by 2002:a17:90a:fb82:b0:253:3ce4:b421 with SMTP id cp2-20020a17090afb8200b002533ce4b421mr1398373pjb.1.1684388888771;
        Wed, 17 May 2023 22:48:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4AV6TUVzZne1jfGuSpqWcEcgpPUq8GBRbmztuvfhJQnlab8FbDREpW1LOgppb5RwfG341BSl8rSAwFLo//JyU=
X-Received: by 2002:a17:90a:fb82:b0:253:3ce4:b421 with SMTP id
 cp2-20020a17090afb8200b002533ce4b421mr1398349pjb.1.1684388888225; Wed, 17 May
 2023 22:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <PH0PR12MB54816668AFE3CF0F90C8F342DC7F9@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54816668AFE3CF0F90C8F342DC7F9@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Ariel Adam <aadam@redhat.com>
Date: Thu, 18 May 2023 08:47:56 +0300
Message-ID: <CANerMUV1vCA9j6QJ+0q93VoUeUkesuv_mToK6o3iz0989OC+Fg@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000058c24c05fbf1598e"
Subject: Re: [virtio-comment] virtio networking collaboration meeting: call
 for agenda

--00000000000058c24c05fbf1598e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The "Virtio-networking upstream biweekly meeting" which happens on
Wednesday's every 2 weeks (led by Eugenio and Jason) was meant to get all
the companies interested in virtio networking together to help move things
forward (both virtio-networking/spec and vDPA).

See meeting notes from previous meetings:
https://docs.google.com/document/d/1FoPi81zQmo5y20G0Yntg-eGHX14LnWc63TwR57m=
Cbs4/edit#

Why not use that meeting and just add more topics given that a lot of
the relevant companies already join this meeting?

Thanks.

On Thu, May 18, 2023 at 3:54=E2=80=AFAM Parav Pandit <parav@nvidia.com> wro=
te:

> Hi all,
>
> At the moment to my knowledge, many TC members are working on many new
> features for virtio network device specification - all of us working in
> parallel.
>
> I feel a biweekly meeting would help us virtio networking developers
> collaborate more effectively.
> For example, we can discuss how do features each one is working on
> interact, what timeframe is each one targeting, etc.
>
> I suggest:
> - A biweekly meeting using google meet.
> - Meeting agenda will be posted on list before a week so people
>   will have a full week to review, respond on the existing mailing lists.
> - If no agenda items for that meeting day, meeting will be cancelled.
> - Minutes will be posted on list after a meeting.
> - non-TC members can also join; this is an additional space to get input
>   from outside experts, under the existing terms of OASIS feedback licens=
e.
>
> - All decisions are still made by TC electronic ballot as usual. Proposed
> collaboration
>   meetings are unrelated to TC ballot. The point is ability to
> collaborate,
>   plan and split work better between developers working in the same spec
> area.
>
> For the first meeting, I propose the following agenda item:
> - discuss new virtio net device features for 1.4 spec release
>
> I suggest several day & time slots.
> Days:
> - Tue (May 30) or
> - Wed (May 31)
> Time:
> - 2 pm GMT, or
> - 5 am GMT
>
> We can pick other time/day options as well depending on who wants to
> attend and in which time zone.
>
> If all this sounds interesting to you, if you would like to attend this
> and hopefully future collaboration meetings,
> please reply with email, cc to list:
> a. preferred time slots that work for you.
> b. any items you would like to add to above agenda.
>
> Any other comments, suggestions?
>
> Regards,
> Parav Pandit
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

--00000000000058c24c05fbf1598e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The &quot;Virtio-networking upstream biweekly meeting&quot=
; which happens on Wednesday&#39;s every 2 weeks (led by Eugenio and Jason)=
 was meant to get all the companies interested in virtio networking togethe=
r to help move things forward (both virtio-networking/spec and vDPA).<div><=
br></div><div>See meeting notes from previous=C2=A0meetings:=C2=A0<a href=
=3D"https://docs.google.com/document/d/1FoPi81zQmo5y20G0Yntg-eGHX14LnWc63Tw=
R57mCbs4/edit#">https://docs.google.com/document/d/1FoPi81zQmo5y20G0Yntg-eG=
HX14LnWc63TwR57mCbs4/edit#</a></div><div><br></div><div>Why not use that me=
eting and just add more topics given that a lot of the=C2=A0relevant compan=
ies already join this meeting?</div><div><br></div><div>Thanks.=C2=A0 =C2=
=A0=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, May 18, 2023 at 3:54=E2=80=AFAM Parav Pandit &lt;<a=
 href=3D"mailto:parav@nvidia.com">parav@nvidia.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hi all,<br>
<br>
At the moment to my knowledge, many TC members are working on many new feat=
ures for virtio network device specification - all of us working in paralle=
l.<br>
<br>
I feel a biweekly meeting would help us virtio networking developers collab=
orate more effectively.<br>
For example, we can discuss how do features each one is working on interact=
, what timeframe is each one targeting, etc.<br>
<br>
I suggest:<br>
- A biweekly meeting using google meet.<br>
- Meeting agenda will be posted on list before a week so people<br>
=C2=A0 will have a full week to review, respond on the existing mailing lis=
ts.<br>
- If no agenda items for that meeting day, meeting will be cancelled.<br>
- Minutes will be posted on list after a meeting.<br>
- non-TC members can also join; this is an additional space to get input<br=
>
=C2=A0 from outside experts, under the existing terms of OASIS feedback lic=
ense.<br>
<br>
- All decisions are still made by TC electronic ballot as usual. Proposed c=
ollaboration<br>
=C2=A0 meetings are unrelated to TC ballot. The point is ability to collabo=
rate, <br>
=C2=A0 plan and split work better between developers working in the same sp=
ec area.<br>
<br>
For the first meeting, I propose the following agenda item:<br>
- discuss new virtio net device features for 1.4 spec release<br>
<br>
I suggest several day &amp; time slots.<br>
Days:<br>
- Tue (May 30) or<br>
- Wed (May 31)<br>
Time:<br>
- 2 pm GMT, or <br>
- 5 am GMT<br>
<br>
We can pick other time/day options as well depending on who wants to attend=
 and in which time zone.<br>
<br>
If all this sounds interesting to you, if you would like to attend this and=
 hopefully future collaboration meetings, <br>
please reply with email, cc to list:<br>
a. preferred time slots that work for you.<br>
b. any items you would like to add to above agenda.<br>
<br>
Any other comments, suggestions?<br>
<br>
Regards,<br>
Parav Pandit<br>
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
</blockquote></div>

--00000000000058c24c05fbf1598e--

