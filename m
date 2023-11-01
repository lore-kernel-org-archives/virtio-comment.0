Return-Path: <virtio-comment-return-8095-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB91C4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 09:07:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E4C4126A3A
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 09:07:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CCCA2986BBB
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 09:07:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C17C8986BB6; Wed,  1 Nov 2023 09:07:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B2C9C986BB7
	for <virtio-comment@lists.oasis-open.org>; Wed,  1 Nov 2023 09:07:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Hbvri8ISMMujBkEhsG0_1A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698829675; x=1699434475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=osTBCuZexyHKWNR1KVsB/mai1UZq5R6416d1QglNey4=;
        b=cbrY7USPZM4aDb7lvjc/HAMJND7MnEdJxOVB+F2NJHJ8xGa7B9+SfpLnesX2T6BtxT
         AIMDXn4y1JGwnWOIohO8xZwyo0PwctcbGJhWBbz99ISnLeWUy293bHF3VKSULfCw0M7T
         3LYLxh8ci6BoUwMsSyAYchwDxR0KRDOOaTdSDKbOm14HlBm7JfYQ4HkU/dbbbE1kFFQw
         U+HObMvmFybEtxVWKA+Z0726tXpDGYeNkwUm/kAmzt4YXxCzEqQqP/AKkff13/1YP/3A
         PxJYlSKsicm2BRSlxqHQPQJg5eYeNHfyXs95RYASXfUqpR+tgBnjJwQlDQoJR/6HBzZy
         vDCQ==
X-Gm-Message-State: AOJu0YxA97FM26Lib3EZmVfhOLMIOTxfURUa0fDpkJaFSevts1flfhba
	lzvo8LMSXC52Yp++6G6HhZgHm17+nZmVz6JQWSmYz5EyLFyyLoAomdkRaJGH6sdfAyJ9qMhVHoX
	FCEefA2CYtklQL9///FgMdd72E1MzI2oISg==
X-Received: by 2002:a17:906:6d0:b0:9c4:4b20:44a4 with SMTP id v16-20020a17090606d000b009c44b2044a4mr1027729ejb.48.1698829675087;
        Wed, 01 Nov 2023 02:07:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIx+VRLDmXx2VQ2wEgiAjd6y/93/93lpkTi/CyY+MHx447XYQbzceKDUyq7xWzUhRhn/isWw==
X-Received: by 2002:a17:906:6d0:b0:9c4:4b20:44a4 with SMTP id v16-20020a17090606d000b009c44b2044a4mr1027719ejb.48.1698829674791;
        Wed, 01 Nov 2023 02:07:54 -0700 (PDT)
Date: Wed, 1 Nov 2023 05:07:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231101050628-mutt-send-email-mst@kernel.org>
References: <20231101012540-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54802C006C5ADE546783E610DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231101023257-mutt-send-email-mst@kernel.org>
 <0bc21f96-486d-481f-8676-5144225e43bc@intel.com>
 <PH0PR12MB5481DCAAFA84932C9D826C4ADCA7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7b130c22-3c07-4f3d-80bc-7ee4fb7dea70@intel.com>
 <PH0PR12MB54810FE590680689D3140911DCA7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <534d3350-ebe8-42f0-a961-a9675c76f984@intel.com>
 <PH0PR12MB54811086EF9D3E96628DEF02DCA7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0080c62c-7516-452b-8b14-0a0871de6574@intel.com>
MIME-Version: 1.0
In-Reply-To: <0080c62c-7516-452b-8b14-0a0871de6574@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Wed, Nov 01, 2023 at 04:55:01PM +0800, Zhu, Lingshan wrote:
> > So do you want MSIX table as part of device context or not?
> MSI is a part of device context as I suggest you to read QEMU code for the
> answers.
> 
> You will also found that part is already done.
> 
> So I don't know why this is a topic worthy discussions.
> 
> If you have questions, I still suggest you read QEMU code.

Frankly at this point I don't know what you are trying to say either.

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

