Return-Path: <virtio-comment-return-5972-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03986C77B7A
	for <virtio-comment@archiver.kernel.org>; Thu, 18 May 2023 19:32:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 53E252A880
	for <virtio-comment@archiver.kernel.org>; Thu, 18 May 2023 19:32:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 39FA5986721
	for <virtio-comment@archiver.kernel.org>; Thu, 18 May 2023 19:32:05 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2A15D986719; Thu, 18 May 2023 19:32:05 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1738398671B
	for <virtio-comment@lists.oasis-open.org>; Thu, 18 May 2023 19:32:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 2D56NqhMNp6tLdq0BNDmMQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684438320; x=1687030320;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gk/P5Q6oh1+J+yS32XgtUK/J5UnvxwCTenW4e37ooOg=;
        b=ClIt1MRjOiq7RflzefQIKR15+JYmQqjI/vSj62hFhQQlX/Cct6D+X8Ir3VFgiXISJX
         qN5DUDGNWHkKkWfUGjtXhH8bLmlPL1sOakR223yMeg/q88xWEgXzVqU/GMYuP29i4zCS
         TbC5O+T7umcc0xbsM+8ij4DjxCnSlMdnDpx/ILgPqgASpNYPw6+qtLXyAw234/TqPIBx
         FbCW5nmib1IIqhaxfPQFlZfG55kxAl/hHM8BRwonRWd7MQYg6rYBL+p4eCgHIX4zR9hS
         mkcEy5WSRfCb/IMuaRpdSaslo7zFohTp0lv3tVoyaI3Fcg8R53bFu4k+5j26ZLRuRDkM
         Xd6g==
X-Gm-Message-State: AC+VfDyTzx1ntcIEYqxrQWBtbK8PaZFGf1ZnzOySvipc87NbOoW7j+V1
	+7vS5FbNOzzhBjR/xZVx0V4rgkkBCWu545hmM6wUIoMgg7ml5Mihtu5X+rCebS4V/7hyC1oxPaJ
	lEGuwPeISooNUZA6wDC01nyKgac/SFan1iQ==
X-Received: by 2002:ac2:5df6:0:b0:4f1:3bd7:e53a with SMTP id z22-20020ac25df6000000b004f13bd7e53amr86708lfq.49.1684438320253;
        Thu, 18 May 2023 12:32:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5QRCZ3cz3t3VPQgl3kvZoUBm8OnUQl00Pfd8hopWEMlJVZJ4zRiR3BVhJ55TzGenmnpwyrWA==
X-Received: by 2002:ac2:5df6:0:b0:4f1:3bd7:e53a with SMTP id z22-20020ac25df6000000b004f13bd7e53amr86700lfq.49.1684438319892;
        Thu, 18 May 2023 12:31:59 -0700 (PDT)
Date: Thu, 18 May 2023 15:31:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Chet Ensign <chet.ensign@oasis-open.org>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
	Ariel Adam <aadam@redhat.com>, Parav Pandit <parav@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20230518151424-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB54816668AFE3CF0F90C8F342DC7F9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CANerMUV1vCA9j6QJ+0q93VoUeUkesuv_mToK6o3iz0989OC+Fg@mail.gmail.com>
 <CAJaqyWf1bKrSZOLY3R2KxZxgLnJ1BH=PXzqvatBHmKQs3zgL9A@mail.gmail.com>
 <CAAwgnnMgyWqm9wAU0y7DXt7TAO=TtfPuBW4omFajw=eSeYOc-g@mail.gmail.com>
 <20230518143013-mutt-send-email-mst@kernel.org>
 <CAAwgnnOfyKsjb-h4OuZXhM0XVH1xvn5cfZMUXG=xwJZ7qBjEig@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAwgnnOfyKsjb-h4OuZXhM0XVH1xvn5cfZMUXG=xwJZ7qBjEig@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [virtio] Re: [virtio-comment] virtio networking collaboration
 meeting: call for agenda

Well this is why I said:
>     Neither can material be solely
>     presented in such a meeting or in the doc linked - it has to be posted
>     to the mailing list to be considered for inclusion in the specification.

This should serve to protect the IPR - while people can discuss
whatever, for things to be in the spec they have to be on list.

As an additional precaution, I think that while subscribing to list is
one way to agree to the feedback license, another is simply asking
anyone who is not a TC member to confirm.

Just in case, I also suggested to Eugenio that anyone discussing issues
connected to a virtio spec is presented with a reminder along the lines
of:

    By joining the meeting, participants agree that any information shared in the
    meeting will be considered submitted by them to the VIRTIO TC, according
    the OASIS Intellectual Property Rights (IPR) Policy
    https://www.oasis-open.org/policies-guidelines/ipr

Hope this helps.

On Thu, May 18, 2023 at 03:09:38PM -0400, Chet Ensign wrote:
> Thanks, Michael. I knew the TC operates that way so I found the exchange
> confusing. 
> 
> The key issue here is IPR commitments that go with contributions. When someone
> makes a contribution to the TC - chunk of code or whatever - their IPR has to
> be covered. For TC members, they are committed by joining and being on the
> roster. For any non-TC members, contribution has to be done via the comment
> list to gain the equivalent commitment. That protection for the TC and Oasis is
> the key thing I look for. 
> 
> On Thu, May 18, 2023 at 2:47 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> 
>     Chet, all,
> 
>     In fact TC voted to conduct all business by electronic ballot, without
>     meetings.
> 
>     Both non-TC and TC members will inevitably meet to discuss things like
>     their plans or implementation efforts. We hardly can, or want to,
>     prevent that. However:
>     Any such meetings are not mandatory to maintain voting rights. Anything
>     discussed in such meetings has no force as a TC decision. Such a meeting
>     will not be listed in the TC calendar. Neither can material be solely
>     presented in such a meeting or in the doc linked - it has to be posted
>     to the mailing list to be considered for inclusion in the specification.
> 
>     In particular all this applies to the Virtio-networking upstream
>     biweekly meeting - this is not a TC meeting, but some TC members attend
>     it.
> 
> 
> 
>     On Thu, May 18, 2023 at 12:53:41PM -0400, Chet Ensign wrote:
>     > Just a reminder everyone that you must be a TC member to participate in
>     TC
>     > meetings. Eugenio, Ariel, I don't see you on the roster. Let me know if
>     you
>     > need directions on how to set up your OASIS logins as Redhat employees. 
>     >
>     > Thanks, 
>     >
>     > /chet 
>     >
>     > On Thu, May 18, 2023 at 5:33 AM Eugenio Perez Martin <eperezma@redhat.com
>     >
>     > wrote:
>     >
>     >     On Thu, May 18, 2023 at 7:48 AM Ariel Adam <aadam@redhat.com> wrote:
>     >     >
>     >     > The "Virtio-networking upstream biweekly meeting" which happens on
>     >     Wednesday's every 2 weeks (led by Eugenio and Jason) was meant to get
>     all
>     >     the companies interested in virtio networking together to help move
>     things
>     >     forward (both virtio-networking/spec and vDPA).
>     >     >
>     >     > See meeting notes from previous meetings: https://docs.google.com/
>     >     document/d/1FoPi81zQmo5y20G0Yntg-eGHX14LnWc63TwR57mCbs4/edit#
>     >     >
>     >     > Why not use that meeting and just add more topics given that a lot
>     of the
>     >     relevant companies already join this meeting?
>     >     >
>     >
>     >     Yes, that fits perfectly with the purpose of the meeting. And it has
>     >     been used in the past to discuss AQ if I recall correctly.
>     >
>     >     The shared document is already open for writing so everybody can
>     >     propose new topics.
>     >
>     >     Thanks for bringing it to the discussion!
>     >
>     >     > Thanks.
>     >     >
>     >     > On Thu, May 18, 2023 at 3:54 AM Parav Pandit <parav@nvidia.com>
>     wrote:
>     >     >>
>     >     >> Hi all,
>     >     >>
>     >     >> At the moment to my knowledge, many TC members are working on many
>     new
>     >     features for virtio network device specification - all of us working
>     in
>     >     parallel.
>     >     >>
>     >     >> I feel a biweekly meeting would help us virtio networking
>     developers
>     >     collaborate more effectively.
>     >     >> For example, we can discuss how do features each one is working on
>     >     interact, what timeframe is each one targeting, etc.
>     >     >>
>     >     >> I suggest:
>     >     >> - A biweekly meeting using google meet.
>     >     >> - Meeting agenda will be posted on list before a week so people
>     >     >>   will have a full week to review, respond on the existing mailing
>     >     lists.
>     >     >> - If no agenda items for that meeting day, meeting will be
>     cancelled.
>     >     >> - Minutes will be posted on list after a meeting.
>     >     >> - non-TC members can also join; this is an additional space to get
>     input
>     >     >>   from outside experts, under the existing terms of OASIS feedback
>     >     license.
>     >     >>
>     >     >> - All decisions are still made by TC electronic ballot as usual.
>     >     Proposed collaboration
>     >     >>   meetings are unrelated to TC ballot. The point is ability to
>     >     collaborate,
>     >     >>   plan and split work better between developers working in the
>     same spec
>     >     area.
>     >     >>
>     >     >> For the first meeting, I propose the following agenda item:
>     >     >> - discuss new virtio net device features for 1.4 spec release
>     >     >>
>     >     >> I suggest several day & time slots.
>     >     >> Days:
>     >     >> - Tue (May 30) or
>     >     >> - Wed (May 31)
>     >     >> Time:
>     >     >> - 2 pm GMT, or
>     >     >> - 5 am GMT
>     >     >>
>     >     >> We can pick other time/day options as well depending on who wants
>     to
>     >     attend and in which time zone.
>     >     >>
>     >     >> If all this sounds interesting to you, if you would like to attend
>     this
>     >     and hopefully future collaboration meetings,
>     >     >> please reply with email, cc to list:
>     >     >> a. preferred time slots that work for you.
>     >     >> b. any items you would like to add to above agenda.
>     >     >>
>     >     >> Any other comments, suggestions?
>     >     >>
>     >     >> Regards,
>     >     >> Parav Pandit
>     >     >>
>     >     >> This publicly archived list offers a means to provide input to the
>     >     >> OASIS Virtual I/O Device (VIRTIO) TC.
>     >     >>
>     >     >> In order to verify user consent to the Feedback License terms and
>     >     >> to minimize spam in the list archive, subscription is required
>     >     >> before posting.
>     >     >>
>     >     >> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>     >     >> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>     >     >> List help: virtio-comment-help@lists.oasis-open.org
>     >     >> List archive: https://lists.oasis-open.org/archives/virtio-comment
>     /
>     >     >> Feedback License: https://www.oasis-open.org/who/ipr/
>     >     feedback_license.pdf
>     >     >> List Guidelines: https://www.oasis-open.org/policies-guidelines/
>     >     mailing-lists
>     >     >> Committee: https://www.oasis-open.org/committees/virtio/
>     >     >> Join OASIS: https://www.oasis-open.org/join/
>     >     >>
>     >
>     >
>     >     This publicly archived list offers a means to provide input to the
>     >     OASIS Virtual I/O Device (VIRTIO) TC.
>     >
>     >     In order to verify user consent to the Feedback License terms and
>     >     to minimize spam in the list archive, subscription is required
>     >     before posting.
>     >
>     >     Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>     >     Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>     >     List help: virtio-comment-help@lists.oasis-open.org
>     >     List archive: https://lists.oasis-open.org/archives/virtio-comment/
>     >     Feedback License: https://www.oasis-open.org/who/ipr/
>     feedback_license.pdf
>     >     List Guidelines: https://www.oasis-open.org/policies-guidelines/
>     >     mailing-lists
>     >     Committee: https://www.oasis-open.org/committees/virtio/
>     >     Join OASIS: https://www.oasis-open.org/join/
>     >
>     >
>     >
>     >
>     > --
>     >            Chet Ensign
>     >
>     >            Chief Technical                      [p]  +1 201-341-1393
>     > [AIorK4wW] Community Steward                    [e] 
>     chet.ensign@oasis-open.org
>     >                                                 [l]  www.oasis-open.org
>     >            OASIS Open
>     >
> 
> 
>     ---------------------------------------------------------------------
>     To unsubscribe from this mail list, you must leave the OASIS TC that
>     generates this mail.  Follow this link to all your TCs in OASIS at:
>     https://www.oasis-open.org/apps/org/workgroup/portal/my_workgroups.php
> 
> 
> 
> 
> --
>            Chet Ensign
> 
>            Chief Technical                      [p]  +1 201-341-1393
> [AIorK4wW] Community Steward                    [e]  chet.ensign@oasis-open.org
>                                                 [l]  www.oasis-open.org
>            OASIS Open
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

