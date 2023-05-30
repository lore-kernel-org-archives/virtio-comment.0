Return-Path: <virtio-comment-return-6040-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B12BC77B73
	for <virtio-comment@archiver.kernel.org>; Tue, 30 May 2023 18:41:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7745F68462
	for <virtio-comment@archiver.kernel.org>; Tue, 30 May 2023 18:41:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6DAB398659A
	for <virtio-comment@archiver.kernel.org>; Tue, 30 May 2023 18:41:55 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5F46D98658D; Tue, 30 May 2023 18:41:55 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 494B598658F
	for <virtio-comment@lists.oasis-open.org>; Tue, 30 May 2023 18:41:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: djOQz04xPwCfH0x6fQV-jg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685472111; x=1688064111;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vF2Eq0A5/A3zv4uOLb1UIxmFsqt011dgjfIbB/hEfr0=;
        b=hKr23YfQluD2mxwS8mpYws96OjNDYEvwng269hCeg9sdpymsnm5zLL8frwgZSMLIm8
         +VlOyWokdEs/3rAfuk7nSkgYZhHhgtlCtMF7UNRGXWY1xQDGsb4zC55PkcU11hRcHuR8
         nZHrDqofSHTKjpCjexHO459DGQH5Oea9MONUxJT4zwOHXv4XwVWbXV5BqaovTWixSlTb
         f6uPpDWm/BUSt3Wc0IMVoA/iR4qqcUs9XwshEE1FO43FafSq3ekRFO/pKlUeXvxIMlWB
         IhraYDuBNi8mAnvjAR9B1lNCN0kvaAClRVlb3TKEkSrZkAsUrCwipkguOM+dkUZouBKx
         oM1w==
X-Gm-Message-State: AC+VfDyXqV3SC2u7DUklF8FX+o7DI56NXtVLPF8GQ0wDv3197CxC3Exk
	YIEvl07vlBo14i9SfYlovcMt0k+UNMFKf2Vnhzn66hxoTMgr6/aOV3t3FxnwqMcMqMQ6wcrjn2W
	QzjnS/004ZAdOkEmKy8uOgyOk3PiqyKheZQ==
X-Received: by 2002:ac2:4829:0:b0:4f3:a99f:1ea3 with SMTP id 9-20020ac24829000000b004f3a99f1ea3mr1241740lft.32.1685472111558;
        Tue, 30 May 2023 11:41:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ66AK30CTcFWAPcQw73Vpv1mMbPFj4Hhhhhw7q78woCL49Kqztyuf6G0cJ0yyfEEqbh0NNYBg==
X-Received: by 2002:ac2:4829:0:b0:4f3:a99f:1ea3 with SMTP id 9-20020ac24829000000b004f3a99f1ea3mr1241728lft.32.1685472111212;
        Tue, 30 May 2023 11:41:51 -0700 (PDT)
Date: Tue, 30 May 2023 14:41:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Ariel Adam <aadam@redhat.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20230530142741-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB54816668AFE3CF0F90C8F342DC7F9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CANerMUV1vCA9j6QJ+0q93VoUeUkesuv_mToK6o3iz0989OC+Fg@mail.gmail.com>
 <PH0PR12MB54811AD7B2B63CF675EB7B76DC429@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54811AD7B2B63CF675EB7B76DC429@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [virtio] RE: [virtio-comment] virtio networking collaboration
 meeting: call for agenda

On Sun, May 21, 2023 at 08:58:42PM +0000, Parav Pandit wrote:
> Hi Ariel,
> 
>  
> 
> Thanks for the suggestion.
> 
> Two separate meetings enable the attendees to choose all 3 options based on
> their interest, time, project participation and more.
> 
>  a. Join both
>  b. Join vdpa discussions
>  c. Join virtio net spec discussions
> 
>  
> 
> So I will continue as dedicate one.

Or just look at the agenda for each meeting and decide?
The meeting Ariel mentioned below is "virtio networking upstream
meeting". Who said it is about vdpa?

At meetings are unofficial, feel free to do whatever, but if their
purpose is to give as wide an audience as possible insight into your
ideas in order to help progress, then surely splintering the already
narrow "networking device" community even further will not achive that.

And resulting confusion among possible contributors with respect to
which meeting to present at, is not welcome.


>  
> 
> Thanks,
> 
> Parav
> 
>  
> 
> From: Ariel Adam <aadam@redhat.com>
> Sent: Thursday, May 18, 2023 1:48 AM
> To: Parav Pandit <parav@nvidia.com>
> Cc: virtio@lists.oasis-open.org; virtio-comment@lists.oasis-open.org
> Subject: Re: [virtio-comment] virtio networking collaboration meeting: call for
> agenda
> 
>  
> 
> The "Virtio-networking upstream biweekly meeting" which happens on Wednesday's
> every 2 weeks (led by Eugenio and Jason) was meant to get all the companies
> interested in virtio networking together to help move things forward (both
> virtio-networking/spec and vDPA).
> 
>  
> 
> See meeting notes from previous meetings: https://docs.google.com/document/d/
> 1FoPi81zQmo5y20G0Yntg-eGHX14LnWc63TwR57mCbs4/edit#
> 
>  
> 
> Why not use that meeting and just add more topics given that a lot of
> the relevant companies already join this meeting?
> 
>  
> 
> Thanks.    
> 
>  
> 
> On Thu, May 18, 2023 at 3:54 AM Parav Pandit <parav@nvidia.com> wrote:
> 
>     Hi all,
> 
>     At the moment to my knowledge, many TC members are working on many new
>     features for virtio network device specification - all of us working in
>     parallel.
> 
>     I feel a biweekly meeting would help us virtio networking developers
>     collaborate more effectively.
>     For example, we can discuss how do features each one is working on
>     interact, what timeframe is each one targeting, etc.
> 
>     I suggest:
>     - A biweekly meeting using google meet.
>     - Meeting agenda will be posted on list before a week so people
>       will have a full week to review, respond on the existing mailing lists.
>     - If no agenda items for that meeting day, meeting will be cancelled.
>     - Minutes will be posted on list after a meeting.
>     - non-TC members can also join; this is an additional space to get input
>       from outside experts, under the existing terms of OASIS feedback license.
> 
>     - All decisions are still made by TC electronic ballot as usual. Proposed
>     collaboration
>       meetings are unrelated to TC ballot. The point is ability to collaborate,
>       plan and split work better between developers working in the same spec
>     area.
> 
>     For the first meeting, I propose the following agenda item:
>     - discuss new virtio net device features for 1.4 spec release
> 
>     I suggest several day & time slots.
>     Days:
>     - Tue (May 30) or
>     - Wed (May 31)
>     Time:
>     - 2 pm GMT, or
>     - 5 am GMT
> 
>     We can pick other time/day options as well depending on who wants to attend
>     and in which time zone.
> 
>     If all this sounds interesting to you, if you would like to attend this and
>     hopefully future collaboration meetings,
>     please reply with email, cc to list:
>     a. preferred time slots that work for you.
>     b. any items you would like to add to above agenda.
> 
>     Any other comments, suggestions?
> 
>     Regards,
>     Parav Pandit
> 
>     This publicly archived list offers a means to provide input to the
>     OASIS Virtual I/O Device (VIRTIO) TC.
> 
>     In order to verify user consent to the Feedback License terms and
>     to minimize spam in the list archive, subscription is required
>     before posting.
> 
>     Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>     Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>     List help: virtio-comment-help@lists.oasis-open.org
>     List archive: https://lists.oasis-open.org/archives/virtio-comment/
>     Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
>     List Guidelines: https://www.oasis-open.org/policies-guidelines/
>     mailing-lists
>     Committee: https://www.oasis-open.org/committees/virtio/
>     Join OASIS: https://www.oasis-open.org/join/
> 


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

