Return-Path: <virtio-comment-return-7959-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA755C0032E
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 10:29:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3D08D330A5
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 10:29:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1B4519869EC
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 10:29:18 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0728A9869E3; Wed, 25 Oct 2023 10:29:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EE40E9869E4
	for <virtio-comment@lists.oasis-open.org>; Wed, 25 Oct 2023 10:29:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: BwnWJD9qN5GYFABchraakQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698229745; x=1698834545;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gisuf9Ck3eooHQrc+aGXSe7SAaC8ijzcLAI+ckZNHTc=;
        b=NF9fyJpOlXuCxzEWnpBM7JJM27eoFOrGAAOVQz9SxZhsAcMqCyo3JMrn7yVlyVKSEL
         TbQeTjoFW/9+5l2CyIPVk3guZwiDlzH7d/bT+cB8aXqCnZfatC6YHCJMAjFv6NjS0JLt
         2l+xbcDFCVYukyapWg1ms8drM2cyL5+jzZtFiL9P1p8ZlSHQlQMHk/JUpMZXKHO6AuZY
         LwN6iUjuRhldfT6OgU8sKIp14sUwPgQf60JzADWC3pHRzvAxJn5iLb9lzzklwTgXH1Zr
         YKfVHu6xq0917SmJ68628dgW9aMUoTg9RGS31a9Dt+KQYoRFNgwyGxK/Wy5+gnV0xzQR
         mPcQ==
X-Gm-Message-State: AOJu0YzNBrsvLMp3yRVVQvbKiRuB2RF57b89K8TfXh4I0scbBtHkSKQ9
	vvd4ff1zykn751yQ4dhTkqS2dvnwaHnaZufEdTYzGzTxG5nhIh5907buet0GkxKh5seAJcStLca
	AwV8jUW1wwYxpMVP47/BvDId4XY9z5v6P6g==
X-Received: by 2002:a05:600c:1f90:b0:405:92f9:b090 with SMTP id je16-20020a05600c1f9000b0040592f9b090mr11608862wmb.14.1698229744870;
        Wed, 25 Oct 2023 03:29:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH++wvphoArh/Ci8KTjGageG3ehUec7u/wH9AQil0+KvTliZ3HMhEyfSOhqmso7z7dPEXuHlw==
X-Received: by 2002:a05:600c:1f90:b0:405:92f9:b090 with SMTP id je16-20020a05600c1f9000b0040592f9b090mr11608840wmb.14.1698229744569;
        Wed, 25 Oct 2023 03:29:04 -0700 (PDT)
Date: Wed, 25 Oct 2023 06:28:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231025062455-mutt-send-email-mst@kernel.org>
References: <CACGkMEsJVxPuxCGjKs3R-kaVGfDMNjtAovM7PpBt3TVd8HON0g@mail.gmail.com>
 <PH0PR12MB5481DD16B25251BAC25AA908DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEthURdu4UNYXPseA-5g6mci2CFDP_UKKC1qFy+n7NHAKg@mail.gmail.com>
 <PH0PR12MB5481BBC4E48145A02C8963ABDCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu3nC8G3Xo2EaunQ4k4rnB27UQMUvruXaf81_sZF7w-cQ@mail.gmail.com>
 <PH0PR12MB548120210DC4AC23382D8A99DCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231025041653-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481B91F71A81D1B57401968DCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231025061755-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548162B95B329056FFCFB247DCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548162B95B329056FFCFB247DCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Wed, Oct 25, 2023 at 10:22:03AM +0000, Parav Pandit wrote:
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, October 25, 2023 3:50 PM
> > 
> > On Wed, Oct 25, 2023 at 09:50:02AM +0000, Parav Pandit wrote:
> > > Hence, I believe device context as defined now is still reusable as common
> > building block.
> > > For non-passthrough, such hypervisor can simply ignore the fields which it is
> > not interested in.
> > 
> > Interesting. So a hypervisor encounters a field it does not recognize. How does
> > hypervisor know that a field is safe to ignore?
> 
> In v2 all the supported fields are published in a query command.
> If hypervisor wants to know the precise fields of interest, when the device reports unknown field, it can make its decision to ignore or fail to work.

It really can't make any decisions here. Some fields are safe to ignore,
some are not but how can you tell?

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

