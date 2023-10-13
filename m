Return-Path: <virtio-comment-return-7723-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2ECCDB47E
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 13:50:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 919063357E
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 13:50:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 69351986844
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 13:50:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 494F2986837; Fri, 13 Oct 2023 13:50:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 71805986838
	for <virtio-comment@lists.oasis-open.org>; Fri, 13 Oct 2023 13:49:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: V7272XvTNg-w_yvX6It3xw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697204967; x=1697809767;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hadox0Q4BUlSLtcHnzKV22LC+E8Eg8jT6juzgT+H4rE=;
        b=EC9QzQ8a+pmifYQYfA/Nj00IRnHitSU5lPkRCMSAgXVU0S/pYkEAP9dtTQv1YZvCY3
         f/O29CYmNS4RZ5zY1D9jwGT4pBEfnGD59I+uRCsRqlJ+zTVZGAu2GoUnnV1XxNnD+nxF
         OV7S7AWucTbr6aRS7HGPtikD8/oYnAPZ11pNTaWZejAyaXgxz7oPITvBDZ5bJH1YkLul
         u1SIct4VkYqXbdpTtY5zAICVQLYkyxxTxrG7MHYQw+xSGIoIZq3uRLIgKjZZBZDH300w
         36/M7Zer5m18vVurxrdMIleNBEsl5nblz3Seo1SkrEhYBiMrQ+2pullfFObzQXx3ZGS2
         9izA==
X-Gm-Message-State: AOJu0YxIigpIhkR50s544ijVEyrFTbr76DC1zY0fG1Sn0DWJtnFsibzC
	lKEx7Ib4gM+yLnZNXWaindLLRgNEiCGOPuY5itNmxIEPZgoSjCTNizb8M1hPlxvr/hpquNcvYVM
	wBa7aR/kl0JlF/J2xNcKF5IHlj2rXcAU4+w==
X-Received: by 2002:a5d:4388:0:b0:32d:9755:44f1 with SMTP id i8-20020a5d4388000000b0032d975544f1mr2742817wrq.32.1697204967152;
        Fri, 13 Oct 2023 06:49:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjUKNl47iMXDwAkYbWAtRxswUPiO6YlG5xDyy3MbdCwBrQI1whn7CoNg6tpo3Oda38jidgnQ==
X-Received: by 2002:a5d:4388:0:b0:32d:9755:44f1 with SMTP id i8-20020a5d4388000000b0032d975544f1mr2742797wrq.32.1697204966785;
        Fri, 13 Oct 2023 06:49:26 -0700 (PDT)
Date: Fri, 13 Oct 2023 09:49:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231013093939-mutt-send-email-mst@kernel.org>
References: <DM8PR12MB548001B88B5FA72B403A2AC9DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <85c59856-b68e-940c-08ed-a14e5a02554d@intel.com>
 <PH0PR12MB548135EDA034FDF7AE77C5FDDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cbf6b0b4-c49f-6809-cac8-2d8336a8cc76@intel.com>
 <PH0PR12MB5481A03DDF43FCBD4184693FDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e2696020-8444-0ff3-a774-0b41151a18fb@intel.com>
 <PH0PR12MB548184740ED3C1011C2A85DEDCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <6fc4af28-67d9-781b-a243-a6c2ebf0244c@intel.com>
 <PH0PR12MB548125EFC96DE6640F9F4A34DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <db0719f9-7dc2-4a96-b10b-ecc3dac1a82b@intel.com>
MIME-Version: 1.0
In-Reply-To: <db0719f9-7dc2-4a96-b10b-ecc3dac1a82b@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Fri, Oct 13, 2023 at 05:44:27PM +0800, Zhu, Lingshan wrote:
> > As Michael said, software based nesting is used..
> > See if actual hw based devices can implement it or not. Many components of cpu cannot do N level nesting either, but may be virtio can.
> > I don’t know how yet.
> two facts:
> 1. virito works for nested for years
> 2. your admin vq lm solution does not work for nested

First virtio works but nested migration doesn't: the way virtio works doesn't
allow L1 hypervisor to migrate L2 if it passes virtio through to L2,
except by using full emulation approaches such as shadow vq -
surely, these are still possible.

Second doesn't work is an overstatement.  It remains to be seen what else can
be done though.  You hinted at a depdenency on PASID.  Have owner be a
PASID and Parav's approach seems to work with little to no change.

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

