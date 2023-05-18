Return-Path: <virtio-comment-return-5968-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41EEC77B7A
	for <virtio-comment@archiver.kernel.org>; Thu, 18 May 2023 09:33:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 03CCC120D47
	for <virtio-comment@archiver.kernel.org>; Thu, 18 May 2023 09:33:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DF60F9866FB
	for <virtio-comment@archiver.kernel.org>; Thu, 18 May 2023 09:33:49 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CCB759866F8; Thu, 18 May 2023 09:33:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B8C739866F7
	for <virtio-comment@lists.oasis-open.org>; Thu, 18 May 2023 09:33:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: cj2YwI6YPiyAqRSNjMF5bw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684402421; x=1686994421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/85HU1b3cnNywpQp2HbPndHEZZ+LfnhoL0hHGTHBOSs=;
        b=Wovr5BrZXDXBbcRl881ft24Tf3dnIB3ccfC1DHSaH+RqhhlvhvSdk7IK60DUN7AQF2
         +8B8fWpF+mD2izXobVq7mhzgvFzferfpBiK64OOf+cjksbMZAvmC85RG4FfKZttpyrnV
         umCMNDzlyk4xTWYLQ8pcitxMfuggfhE+euk5Z/d0ceFBQ6vpqedxqu+JYw75bV5N4t6j
         8InrFdhHj08uPhSl2CQmO/luELgiEWgu2VGZpE2tCpcvcAVxn05QFZFCMXhVyKAPQVhr
         JJt/t3l4gcwa0WHyc2OMr4pYIUi5BbanpMlWVP53UhCt/wPSXopo6EkzJBVSAZtE+NA1
         jjBA==
X-Gm-Message-State: AC+VfDyUhRywADPcuON4xIy4RplUnngxRlFhfNINeAlOzUmc3jR1Wd1g
	hmWjza6H4MqWG2x199DBOdb6mde/tUyRgNP4O0P4gxHMICnxDP2h07UXv/rQbilLxV6StuxZa9Q
	KZ/yqmrwvyhJ+o6NbPM7Qx8qJSCzXDr2UT3Xg89JlzGlP9mgtjQ==
X-Received: by 2002:a81:7256:0:b0:54c:1d2e:f371 with SMTP id n83-20020a817256000000b0054c1d2ef371mr706407ywc.27.1684402421541;
        Thu, 18 May 2023 02:33:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ41Joc/cb8F5XwetvQx1bLxzcXThU+V9F8BCbbnkkmuFDl1CQ8fjnSphRLzvprBq3eYef1rvUG8sm1wHaPqFyw=
X-Received: by 2002:a81:7256:0:b0:54c:1d2e:f371 with SMTP id
 n83-20020a817256000000b0054c1d2ef371mr706396ywc.27.1684402421175; Thu, 18 May
 2023 02:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <PH0PR12MB54816668AFE3CF0F90C8F342DC7F9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CANerMUV1vCA9j6QJ+0q93VoUeUkesuv_mToK6o3iz0989OC+Fg@mail.gmail.com>
In-Reply-To: <CANerMUV1vCA9j6QJ+0q93VoUeUkesuv_mToK6o3iz0989OC+Fg@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 18 May 2023 11:33:04 +0200
Message-ID: <CAJaqyWf1bKrSZOLY3R2KxZxgLnJ1BH=PXzqvatBHmKQs3zgL9A@mail.gmail.com>
To: Ariel Adam <aadam@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, 
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] virtio networking collaboration meeting: call
 for agenda

On Thu, May 18, 2023 at 7:48=E2=80=AFAM Ariel Adam <aadam@redhat.com> wrote=
:
>
> The "Virtio-networking upstream biweekly meeting" which happens on Wednes=
day's every 2 weeks (led by Eugenio and Jason) was meant to get all the com=
panies interested in virtio networking together to help move things forward=
 (both virtio-networking/spec and vDPA).
>
> See meeting notes from previous meetings: https://docs.google.com/documen=
t/d/1FoPi81zQmo5y20G0Yntg-eGHX14LnWc63TwR57mCbs4/edit#
>
> Why not use that meeting and just add more topics given that a lot of the=
 relevant companies already join this meeting?
>

Yes, that fits perfectly with the purpose of the meeting. And it has
been used in the past to discuss AQ if I recall correctly.

The shared document is already open for writing so everybody can
propose new topics.

Thanks for bringing it to the discussion!

> Thanks.
>
> On Thu, May 18, 2023 at 3:54=E2=80=AFAM Parav Pandit <parav@nvidia.com> w=
rote:
>>
>> Hi all,
>>
>> At the moment to my knowledge, many TC members are working on many new f=
eatures for virtio network device specification - all of us working in para=
llel.
>>
>> I feel a biweekly meeting would help us virtio networking developers col=
laborate more effectively.
>> For example, we can discuss how do features each one is working on inter=
act, what timeframe is each one targeting, etc.
>>
>> I suggest:
>> - A biweekly meeting using google meet.
>> - Meeting agenda will be posted on list before a week so people
>>   will have a full week to review, respond on the existing mailing lists=
.
>> - If no agenda items for that meeting day, meeting will be cancelled.
>> - Minutes will be posted on list after a meeting.
>> - non-TC members can also join; this is an additional space to get input
>>   from outside experts, under the existing terms of OASIS feedback licen=
se.
>>
>> - All decisions are still made by TC electronic ballot as usual. Propose=
d collaboration
>>   meetings are unrelated to TC ballot. The point is ability to collabora=
te,
>>   plan and split work better between developers working in the same spec=
 area.
>>
>> For the first meeting, I propose the following agenda item:
>> - discuss new virtio net device features for 1.4 spec release
>>
>> I suggest several day & time slots.
>> Days:
>> - Tue (May 30) or
>> - Wed (May 31)
>> Time:
>> - 2 pm GMT, or
>> - 5 am GMT
>>
>> We can pick other time/day options as well depending on who wants to att=
end and in which time zone.
>>
>> If all this sounds interesting to you, if you would like to attend this =
and hopefully future collaboration meetings,
>> please reply with email, cc to list:
>> a. preferred time slots that work for you.
>> b. any items you would like to add to above agenda.
>>
>> Any other comments, suggestions?
>>
>> Regards,
>> Parav Pandit
>>
>> This publicly archived list offers a means to provide input to the
>> OASIS Virtual I/O Device (VIRTIO) TC.
>>
>> In order to verify user consent to the Feedback License terms and
>> to minimize spam in the list archive, subscription is required
>> before posting.
>>
>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>> List help: virtio-comment-help@lists.oasis-open.org
>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pd=
f
>> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-=
lists
>> Committee: https://www.oasis-open.org/committees/virtio/
>> Join OASIS: https://www.oasis-open.org/join/
>>


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

