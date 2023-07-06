Return-Path: <virtio-comment-return-6768-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8487EEB64D9
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Jul 2023 19:43:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 059C04451
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Jul 2023 19:43:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CC29F98680B
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Jul 2023 19:43:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BE92A98672D; Thu,  6 Jul 2023 19:43:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AA46598672E
	for <virtio-comment@lists.oasis-open.org>; Thu,  6 Jul 2023 19:43:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: NsWvbxbVPZqTod-8BjD7bQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688672578; x=1691264578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+2CQXqEVlaO5hax9XcrzEzvVQI5ZaNbs642SYGPfLc=;
        b=je+C+6W+z8GHxka8n1wyn3oXByGcEVesL3Q/2t6cSy5R9ErLpEjfaI6/mcw+EPzBRG
         VKkV8tzIgcGNgkWwvIML8I/f1bt568D8jzaOTH1T3XqmlmOwhg4cgIL954wvQZdr5l2i
         rLZViTsGtsbSnT1tw3/CCq8ev/NDE4MNN/msFdiNZAnnQ7Eu/0iJIgRBDWd9Rkcb0u5/
         r1c4qKMvW56++960NFyBC+hfMyzJGYLllwI9BLBC/3Q2HnbAnF1t3N4SXi0fMsr4r4p9
         YoPk+3IhW6Bg+eXWKQxgwc2Lnc7xW/wY2/vWYuiv3rjTYS0ofn4Dg/lPN74862O1xvTP
         0Pig==
X-Gm-Message-State: ABy/qLYlYncVP7H80jHQg4TWK6pwWK2qpZqafxo0V0hrgu7h/VtTt9Xu
	Evx7hIKLrwldx7SLO+CopJyvwS8Jg0PWFralyOe8icw8/ih6WY0bFqBvk2bPGNAYu1jy6Qmpsvf
	WpPJ3V5wF4FyIIIQVnSCmedH8ZKV+yEr23g==
X-Received: by 2002:a7b:cd1a:0:b0:3fb:c075:b308 with SMTP id f26-20020a7bcd1a000000b003fbc075b308mr2915264wmj.12.1688672578091;
        Thu, 06 Jul 2023 12:42:58 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH79j6OETqx8RY1N/gz9qbl2mLAHb8Je4w208XbKAzoLac5qlqz2GN221sRipecRoXxE/18yQ==
X-Received: by 2002:a7b:cd1a:0:b0:3fb:c075:b308 with SMTP id f26-20020a7bcd1a000000b003fbc075b308mr2915247wmj.12.1688672577808;
        Thu, 06 Jul 2023 12:42:57 -0700 (PDT)
Date: Thu, 6 Jul 2023 15:42:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"sburla@marvell.com" <sburla@marvell.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230706154002-mutt-send-email-mst@kernel.org>
References: <20230706123954-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54817D2E9B0D7C5FE9EA2B0EDC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230706132638-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813564E839C71709DCBDEFDC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230706135858-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481B845ED0FDA919B822941DC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230706144427-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54817A61E0062B9BF3401836DC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230706145538-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481074A79C630384382CB20DC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481074A79C630384382CB20DC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v10 4/4] transport-pci: Introduce group legacy group
 member config region access

On Thu, Jul 06, 2023 at 07:00:22PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, July 6, 2023 2:57 PM
> 
> > > I am just saying to keep things simple. Let driver choose any entry it wants to
> > use instead of device deciding on priority and hints etc.
> > 
> > Let's say driver can support both types which to choose?
> Any entry that driver likes.
> 
> > As the order is there anyway, why not just prescribe entries are used in order?
> 
> I don't see any value in defining any order. It is an array of entries not a priority list.

I think we are losing out. For example I can see how
access through member would be preferable for ordering reasons.
However device might still allow access through PF for cases
where driver can't access VF.

But I don't see any configs where leaving this to the driver's
discretion is preferable. If you see one let me know.

-- 
MST


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

