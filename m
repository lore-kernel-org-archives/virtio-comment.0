Return-Path: <virtio-comment-return-8098-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DD1C4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 10:24:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EF1E12ACAE
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 10:24:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CA81B986BC4
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 10:24:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AE466986BB8; Wed,  1 Nov 2023 10:24:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9DF14986BB9
	for <virtio-comment@lists.oasis-open.org>; Wed,  1 Nov 2023 10:24:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: GcgWBKKLMuOPgdCXVbf95Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698834239; x=1699439039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sa0gOKYUjZJUfX7pLJb09aB5QOocA+6NGdFVNp4a7eQ=;
        b=H9vJ3dIxezABcLpVwyXcOVKGoZA19wdEdx+iR6O842UErhpyniNBAJr4kgG9fq8q4t
         iRH79GOX01Sl+MsS1a3ggFFPH3EgxcQ2j2xoqPd3/aYFEs5cJZgLfczG/jbfSwrc3ucU
         sf8Vuk3WBLLBWu6Rst9IUaOjarJwc9TMrhvQvT9NI9EiYRjXrUDWFWK4sASZWo2c5zgt
         Qx+c1OmZweTtipRdwDr5M6suGE6WLs39GlV935YxyT5Fjc5owwplMxuZYl/80/dbTJPy
         tXIMxl9ZEbjFmXy6wtZaGTfMUPfiWbleIC1D7vOXK4CbmXU+RVcaCnwbl7tNVWlIUvgt
         VKsw==
X-Gm-Message-State: AOJu0YyyuPjWzhtQDqjgXwNw2QvkmMIKC1Xbfew+EEhVgkrHc1pql4AO
	6L4WkCageAZgwog6OdLGwQFSFOo5HxstcZT76/zaSx+kgXbQUO22iKOH8KDZ+dndh/AH2JNQqg5
	fWsF2VXOHke5vt3IGN5v/p3WWTH/wehFalA==
X-Received: by 2002:a50:d583:0:b0:540:31dc:ff8b with SMTP id v3-20020a50d583000000b0054031dcff8bmr12292253edi.13.1698834239561;
        Wed, 01 Nov 2023 03:23:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF93t7K8/bXC5ltQKwMtVlc5hNjBHBhCxk+flZIfw+WCG9txxMalDOIqVuOLOKXdNwg/gTqyw==
X-Received: by 2002:a50:d583:0:b0:540:31dc:ff8b with SMTP id v3-20020a50d583000000b0054031dcff8bmr12292247edi.13.1698834239242;
        Wed, 01 Nov 2023 03:23:59 -0700 (PDT)
Date: Wed, 1 Nov 2023 06:23:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231101062307-mutt-send-email-mst@kernel.org>
References: <20231101023257-mutt-send-email-mst@kernel.org>
 <0bc21f96-486d-481f-8676-5144225e43bc@intel.com>
 <PH0PR12MB5481DCAAFA84932C9D826C4ADCA7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7b130c22-3c07-4f3d-80bc-7ee4fb7dea70@intel.com>
 <PH0PR12MB54810FE590680689D3140911DCA7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <534d3350-ebe8-42f0-a961-a9675c76f984@intel.com>
 <PH0PR12MB54811086EF9D3E96628DEF02DCA7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0080c62c-7516-452b-8b14-0a0871de6574@intel.com>
 <20231101050628-mutt-send-email-mst@kernel.org>
 <d31980f0-caed-4f4e-a46d-9c1325024fb0@intel.com>
MIME-Version: 1.0
In-Reply-To: <d31980f0-caed-4f4e-a46d-9c1325024fb0@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Wed, Nov 01, 2023 at 05:42:43PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 11/1/2023 5:07 PM, Michael S. Tsirkin wrote:
> > On Wed, Nov 01, 2023 at 04:55:01PM +0800, Zhu, Lingshan wrote:
> > > > So do you want MSIX table as part of device context or not?
> > > MSI is a part of device context as I suggest you to read QEMU code for the
> > > answers.
> > > 
> > > You will also found that part is already done.
> > > 
> > > So I don't know why this is a topic worthy discussions.
> > > 
> > > If you have questions, I still suggest you read QEMU code.
> > Frankly at this point I don't know what you are trying to say either.
> MSI table is R/W, so the hypervisor can migrate it now

Yes. And the same applies to most of the state that is part of device
context here.

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

