Return-Path: <virtio-comment-return-8337-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C040C4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Nov 2023 03:41:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9F5D545B29
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Nov 2023 03:41:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7E3D89866F0
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Nov 2023 03:41:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 683689865BD; Mon, 13 Nov 2023 03:41:24 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 57BAF9865C1
	for <virtio-comment@lists.oasis-open.org>; Mon, 13 Nov 2023 03:41:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: uFq5r73kNwCW0yEGW3UQsw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699846879; x=1700451679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T9xq/T9xhVEib6K9H4IsFfUEPSt4RSTYMzBJxUOHaeo=;
        b=DUg5+OTgFQzXExEXx1pn8YFWHLo/GHk2cuTiLGDnsAXbys7KnFKnXQ6DhUg4l5ZEwy
         dHwQq+8aYmdBYPnrewLwTI95Dyuvh9U/qw0h3UnR04LFmWoymFrUC0v7cGSv2DlFxhtW
         /zsm/h62oaXPzGaIISPGBBvR+xpXciEGMcXArVwb1X0+ilbYUaADYX5eWSiwmCszvsib
         AXJkfJGBnDGfK5ovApwDtn3Lu7EnbdqknSOySYQeV27s+KPBNXRNJs3sr21RVEzm5WsH
         6S9iqnZ7g+zUjzR7OLobytLpM9+ZkxgUzxRLqx8ZwymRcq27ZRHk+fjTRvPSHeBoiLpZ
         yMbg==
X-Gm-Message-State: AOJu0Yz91uVcKH7lrTB2m97u8gtM6cbmoll8Wd0vgCNecQVEm4eGnNqq
	fBDtDkqx6M76516q7aj0qCrGR+yHtviIhD1xPJ6RVz8uGD9f4bmKcDZi3fF84rvYd+CMBtWwtd7
	cbLfEG4QFoD/euYH8D67GgOLjZEIjQ5SmVWNnCmkOqK8A/pA4AQ==
X-Received: by 2002:a19:e046:0:b0:4fb:94c6:fd63 with SMTP id g6-20020a19e046000000b004fb94c6fd63mr3113675lfj.17.1699846879336;
        Sun, 12 Nov 2023 19:41:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6EZNmKDAiwr11paPFGMhNGnk3QZspmgKIhFviYbSm11y8Y01R48giRP3RsaoJwmPzRYa7bcWg7dutW+SN26k=
X-Received: by 2002:a19:e046:0:b0:4fb:94c6:fd63 with SMTP id
 g6-20020a19e046000000b004fb94c6fd63mr3113666lfj.17.1699846878970; Sun, 12 Nov
 2023 19:41:18 -0800 (PST)
MIME-Version: 1.0
References: <DM8PR12MB54809F8316720CE5C1BCFF33DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEtFyH_wJAqTz=jwosVM-=SRuO+wpT7NM=Eod8ExsxfTsg@mail.gmail.com>
 <PH0PR12MB54814420718AB387C0C84C07DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com>
 <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <20231107015412-mutt-send-email-mst@kernel.org> <CACGkMEv+jir2+f_vHmi_KjFXf0yz+EQmEbvzX0pheHKsVJkWZw@mail.gmail.com>
 <20231108025854-mutt-send-email-mst@kernel.org> <CACGkMEvkQawXWCvu7rZHnZk8YsNunS_B-fcQmEHEe_N87Q6y6g@mail.gmail.com>
 <20231109022647-mutt-send-email-mst@kernel.org> <PH0PR12MB54813C84CFA5601DB1B47885DCAEA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54813C84CFA5601DB1B47885DCAEA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 13 Nov 2023 11:41:07 +0800
Message-ID: <CACGkMEu-Zs-dxcYRjtV+hLBVy5Tv9JzgT2c83Zjzt7A-a1QR2A@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>, 
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write recording commands

On Fri, Nov 10, 2023 at 2:46=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
> Hi Michael,
>
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, November 9, 2023 1:29 PM
>
> [..]
> > > Besides the issue of performance, it's also racy, assuming we are log=
ging
> > IOVA.
> > >
> > > 0) device log IOVA
> > > 1) hypervisor fetches IOVA from log buffer
> > > 2) guest map IOVA to a new GPA
> > > 3) hypervisor traverse guest table to get IOVA to new GPA
> > >
> > > Then we lost the old GPA.
> >
> > Interesting and a good point. And by the way e.g. vhost has the same is=
sue.  You
> > need to flush dirty tracking info when changing the mappings somehow.  =
Parav
> > what's the plan for this? Should be addressed in the spec too.
> >
> As you listed the flush is needed for vhost or device-based DPT.

What does DPT mean? Device Page Table? Let's not invent terminology
which is not known by others please.

We have discussed it many times. You can't just depend on ATS or
reinventing wheels in virtio.

What's more, please try not to give me the impression that the
proposal is optimized for a specific vendor (like device IOMMU
stuffs).

> The necessary plumbing is already covered for this in the query (read and=
 clear) command of this v3 proposal.

The issue is logging via IOVA ... I don't see how "read and clear" can help=
.

> It is listed in Device Write Records Read Command.

Please explain how your proposal can solve the above race.

>
> When the page write record is fully read, it is flushed.
> How/when to use, I think its hypervisor specific, so we probably better o=
ff not documenting those details.

Well, as the author of this proposal, at least you need to know how a
hypervisor can work with your proposal, no?

> May be such read is needed in some other path too depending on how hyperv=
isor implemented.

What do you mean by "May be ... some other path" here? You're
inventing a mechanism that you don't know how a hypervisor can use?

Thanks


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

