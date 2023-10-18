Return-Path: <virtio-comment-return-7785-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456F9CDB47E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 06:15:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 95D487234D
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 06:15:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 76C19986895
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 06:15:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 69E1898688B; Wed, 18 Oct 2023 06:15:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5916A98688C
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 06:15:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: djFutrIMPbaf_D45ezzkVg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697609696; x=1698214496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFE+JK03q0/XJpmhsXCEtdjc6+aeERiXySAgIYamfxw=;
        b=CpO5Lk+AIW2/AFPX4DTub0Ien9v6FqJgBjiUxLKM1jk9qA5343/OpM1p/OVpfhnuhS
         ptAOG4BCGcZ8Vkt88+CXrdczKfggqgOdOQf4q3BNWSVisp7HHlwP0NuG0i9JS8LXuPvI
         BUFUrhL7SZR0QVCI44wJHwbU9XOxubn/qM/PFmv3kbMbIYLPDB3lr4AIxcNcJ2XPcpeb
         i8e3wtK3mk/PaOj3Ecvyi54PhChcNZjmrxZ0nIjMYrAaXCr4oIP05JqsTowmDpZXsX+f
         HcCSIsH+N1fqBxM3YE2+iC8jtC272CPqSfAsS0mBsBcOxb5XXBkbDDla6mVNST470Uk8
         QM9A==
X-Gm-Message-State: AOJu0Yw5xagMTH4Hi3g+TOe+0cKDnJTLpdSbiRGahJy4lhDfVTZkrZdE
	kFdmBSGh3SnTa/dIY558WVi8tPFDCH1MWoyipKmZNZA401f8U7jUoE/hZnVH1ZQBv8fWNCyDqwb
	miHQzrARlCBIbWR2hSXNZhI1apfd+4krk0A==
X-Received: by 2002:a05:651c:2125:b0:2c5:1490:1687 with SMTP id a37-20020a05651c212500b002c514901687mr3471950ljq.33.1697609696699;
        Tue, 17 Oct 2023 23:14:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/j9+J/ICBu+tKkTtjU4Ni4FLCzpJPD09oRyOU74VUz5du4tXAYtsenwmJEwRHOw44g1ACjA==
X-Received: by 2002:a05:651c:2125:b0:2c5:1490:1687 with SMTP id a37-20020a05651c212500b002c514901687mr3471937ljq.33.1697609696359;
        Tue, 17 Oct 2023 23:14:56 -0700 (PDT)
Date: Wed, 18 Oct 2023 02:14:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231018021423-mutt-send-email-mst@kernel.org>
References: <f875fa3b-4b33-71c2-e612-bc2a674a1e59@intel.com>
 <PH0PR12MB548171A06CCE458C913E4961DCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <97aa9108-0715-2483-f5cf-02698c745d60@intel.com>
 <PH0PR12MB5481F4F3B4FADD79770ADEA6DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt-pUSazfjfROukZdaLdmeX1xP7_OxQaQ=Se=jV5NXkDA@mail.gmail.com>
 <PH0PR12MB5481F8312139BB197CEB024BDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtihTxYADd1dbG=vX9=VLp0xfRJSQ4jd_m0UiuZNz_2sg@mail.gmail.com>
 <PH0PR12MB5481E85F17F9D22CBCC9FDF8DCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu_uRcL293Dd+vo2VvYJfUiCaPYF0dAjk-s6=RUtw-PEQ@mail.gmail.com>
 <PH0PR12MB54813820D9800B4F62C5784FDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54813820D9800B4F62C5784FDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Wed, Oct 18, 2023 at 04:30:39AM +0000, Parav Pandit wrote:
> You should have objected the IMS patches in Linux kernel, you should also object new MSI-X proposal and say just use registers.

What does "new MSI-X proposal" refer to?


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

