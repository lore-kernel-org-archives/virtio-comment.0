Return-Path: <virtio-comment-return-5993-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F233C7EE23
	for <virtio-comment@archiver.kernel.org>; Mon, 22 May 2023 02:48:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D89391395E6
	for <virtio-comment@archiver.kernel.org>; Mon, 22 May 2023 02:48:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D2ED198631A
	for <virtio-comment@archiver.kernel.org>; Mon, 22 May 2023 02:48:14 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CB4BA9862FC; Mon, 22 May 2023 02:48:14 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B877B9862FE;
	Mon, 22 May 2023 02:48:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045192;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0Vj6YBnd_1684723687;
Message-ID: <1684723554.8737867-1-xuanzhuo@linux.alibaba.com>
Date: Mon, 22 May 2023 10:45:54 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 Ariel Adam <aadam@redhat.com>
References: <PH0PR12MB54816668AFE3CF0F90C8F342DC7F9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CANerMUV1vCA9j6QJ+0q93VoUeUkesuv_mToK6o3iz0989OC+Fg@mail.gmail.com>
 <PH0PR12MB54811AD7B2B63CF675EB7B76DC429@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54811AD7B2B63CF675EB7B76DC429@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: RE: [virtio-comment] virtio networking collaboration meeting: call for agenda

On Sun, 21 May 2023 20:58:42 +0000, Parav Pandit <parav@nvidia.com> wrote:
> Hi Ariel,
>
> Thanks for the suggestion.
> Two separate meetings enable the attendees to choose all 3 options based =
on their interest, time, project participation and more.
>
>   1.  Join both
>   2.  Join vdpa discussions
>   3.  Join virtio net spec discussions
>
> So I will continue as dedicate one.
>

I prefer #3.


> Thanks,
> Parav
>
> From: Ariel Adam <aadam@redhat.com>
> Sent: Thursday, May 18, 2023 1:48 AM
> To: Parav Pandit <parav@nvidia.com>
> Cc: virtio@lists.oasis-open.org; virtio-comment@lists.oasis-open.org
> Subject: Re: [virtio-comment] virtio networking collaboration meeting: ca=
ll for agenda
>
> The "Virtio-networking upstream biweekly meeting" which happens on Wednes=
day's every 2 weeks (led by Eugenio and Jason) was meant to get all the com=
panies interested in virtio networking together to help move things forward=
 (both virtio-networking/spec and vDPA).
>
> See meeting notes from previous meetings: https://docs.google.com/documen=
t/d/1FoPi81zQmo5y20G0Yntg-eGHX14LnWc63TwR57mCbs4/edit#<https://docs.google.=
com/document/d/1FoPi81zQmo5y20G0Yntg-eGHX14LnWc63TwR57mCbs4/edit>
>
> Why not use that meeting and just add more topics given that a lot of the=
 relevant companies already join this meeting?
>
> Thanks.
>
> On Thu, May 18, 2023 at 3:54=E2=80=AFAM Parav Pandit <parav@nvidia.com<ma=
ilto:parav@nvidia.com>> wrote:
> Hi all,
>
> At the moment to my knowledge, many TC members are working on many new fe=
atures for virtio network device specification - all of us working in paral=
lel.
>
> I feel a biweekly meeting would help us virtio networking developers coll=
aborate more effectively.
> For example, we can discuss how do features each one is working on intera=
ct, what timeframe is each one targeting, etc.
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
> - All decisions are still made by TC electronic ballot as usual. Proposed=
 collaboration
>   meetings are unrelated to TC ballot. The point is ability to collaborat=
e,
>   plan and split work better between developers working in the same spec =
area.
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

Wed (May 31) 5am GMT is good to me.

Thanks.

>
> We can pick other time/day options as well depending on who wants to atte=
nd and in which time zone.
>
> If all this sounds interesting to you, if you would like to attend this a=
nd hopefully future collaboration meetings,
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
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org<mailto:virtio-co=
mment-subscribe@lists.oasis-open.org>
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org<mailto:virti=
o-comment-unsubscribe@lists.oasis-open.org>
> List help: virtio-comment-help@lists.oasis-open.org<mailto:virtio-comment=
-help@lists.oasis-open.org>
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>

This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

