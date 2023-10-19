Return-Path: <virtio-comment-return-7831-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C72CDB465
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 06:35:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 22F4442A70
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 06:35:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EFEA79868D6
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 06:35:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C774B9868C6; Thu, 19 Oct 2023 06:35:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B7E159868C7
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 06:35:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 3DLdE3TiMqGZfKE-mUHalg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697697312; x=1698302112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JH27Xu/yggo0mw3M5xOnNAhbA06rCFPA205BybLtwtg=;
        b=vAELnlTjxZZNj0b+rQB1OHU+XG2dKdieoterOBfRld64wCoztEFAsvxZ+fNxeJ8+dG
         CzY04h1BhWH8BbOFie+cgUSXt/THD9GDRtKSBhjcHDZYxa/lnlAmJRtttF8cAdGz+31o
         I/sxNLsOj9IoCPHMMsY1Ve5apC53wNbMXGtktbwTYI1GcheuQh+1iJ9ZJ1zBunqCGVvz
         7//ikT6R1i6+BXb1rY1eYRCmFx+FLh46HD1OhfAHG3UQF1GVtJEPgvTwLBnE/kuD4/Ay
         WmnCwSTyAjRyxRZ7ZttzXtSfSef4dnlCLoZhQMg+8EUXlupzVZsxw7wA1Sq+5c8skQvO
         zlAg==
X-Gm-Message-State: AOJu0YwkhwdK6u509Drpe3haww3WP4aLstR3+xhq6PPWnqvalqvWp/eI
	FCQpUdrZPtnPAEWY7fOaswRqtcFTYsvRqDMn4NQwhHgZyK46gamSvVjo6nDSC1csierBdiGLoDR
	0a3sti7MqIF1sqbI4nG9Ffx9KAK5yrJi5Sg==
X-Received: by 2002:a05:600c:4e8e:b0:401:b2c7:349b with SMTP id f14-20020a05600c4e8e00b00401b2c7349bmr1003752wmq.7.1697697312239;
        Wed, 18 Oct 2023 23:35:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDpivphQf1x10Xw/Ofdvshb1Rbmue9DkkZ5Cj/2iUAEuqZjN7I1Jv9jSUQQhVBZxsJBNAoDg==
X-Received: by 2002:a05:600c:4e8e:b0:401:b2c7:349b with SMTP id f14-20020a05600c4e8e00b00401b2c7349bmr1003743wmq.7.1697697311772;
        Wed, 18 Oct 2023 23:35:11 -0700 (PDT)
Date: Thu, 19 Oct 2023 02:35:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231019020413-mutt-send-email-mst@kernel.org>
References: <CACGkMEt-pUSazfjfROukZdaLdmeX1xP7_OxQaQ=Se=jV5NXkDA@mail.gmail.com>
 <PH0PR12MB5481F8312139BB197CEB024BDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtihTxYADd1dbG=vX9=VLp0xfRJSQ4jd_m0UiuZNz_2sg@mail.gmail.com>
 <PH0PR12MB5481E85F17F9D22CBCC9FDF8DCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu_uRcL293Dd+vo2VvYJfUiCaPYF0dAjk-s6=RUtw-PEQ@mail.gmail.com>
 <PH0PR12MB54813820D9800B4F62C5784FDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMF4JVEQJ6skT2DrEWjop6wjKS6ad6dW2UNOA1oRuPKQ@mail.gmail.com>
 <PH0PR12MB548109DEAE4B6C76025BD57ADCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv2fNa_vqbqQmu3ys5tbB4-S-onXvr-pT9U9cd8iut7sA@mail.gmail.com>
 <PH0PR12MB5481EA6A4D0C64C5AF6D3A57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481EA6A4D0C64C5AF6D3A57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Thu, Oct 19, 2023 at 05:31:37AM +0000, Parav Pandit wrote:
> > How could we make any agreement without an accurate the definition of
> > "passthrough" who is a key to understand each other?
> 
> I replied few times in past emails but since those email threads are so long, it is easy to miss out.
> 
> Passthrough definition:
> a. virtio member device mapped to the guest vm
> b. only pci config space and msix of a member device is intercepted by hypervisor.
> c. virtio config space, virtio cvqs, data vqs of a member device is directly accessed by the guest vm without intercepted by the hypervisor.
> 
> (Why b?, no grand reason, it is how the hypervisors are working where to integrate the virtio member device to).

I think it's a reasonable use-case, though of course not at all the only
way to design a system. Some more ways:
2- intercept everything except data vqs and cvqs
	I think this is a reasonable way to build the system and has a bunch
	of advantages short term. The main disadvantage as compared to
	passthrough is the need to keep config space coherent with
	device operation - the way to do it is device specific and
	might get fragile.

4- intercept everything except data vqs
	Here we get another problem in isolating some vqs but not
        others. the problem becomes bigger is that you also
	need to communicate control vq to the device.

also, with both of the above options, we have a question of how
are we communicating with the device to keep control path
and data path in sync when device's dma is mapped to guest.
using PASIDs for isolation might work but again, support is
far from universal so we can't really assume it as
the only way in the spec.

Absent PASID the popular way seems to be shadow vq which basically does

4- software intercept for everything
       clearly that's a lot of CPU overhead, I do not think we can focus on that
       as the only way in the spec, though some hypervisors might
       already have a lot of migration overhead to the point where
       virtio can afford any amount of overhead and it won't be
       measureable.


I also note some or all of the intercepts can always come and go.  For
example, a common setup is that if target VCPUs are running then IOMMU
will inject interrupts directly into guest - if not you generally trap
to hypervisor. Similarly, shadow vq might be active just temporarily.

Which approach is best? I feel ideally virtio would find ways to support
them all rather than deciding on a policy in the spec.

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

