Return-Path: <virtio-comment-return-8078-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FBEC4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 05:31:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 01B6F2B07C
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 05:31:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DC6E6986BB0
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 05:31:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C2A2C986BAD; Wed,  1 Nov 2023 05:31:16 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B2050986BAE
	for <virtio-comment@lists.oasis-open.org>; Wed,  1 Nov 2023 05:31:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: X2MpHjGvPxiKC_9a_wuKeQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698816673; x=1699421473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R63r5rw9sNXPuE3z6tkR7j0owx4sndF88mnlL03BVRU=;
        b=xT5mb3BrzLEg2fEqPwaxViN4JiJpPH0a2f0SQFFg8/5h0H4PE6tB6gT73L9doJeD9O
         XaBmlmjgBcCwAmJQtt4hIU8OPciU/IGxFqw3bCu181rDXAdOX0lI4ydhrUvWcctfV5Av
         M1QC7/T32bDFgaL33p1ZbGCi1gR2VYnrhs2rQwblrCKHyMT517FYXGvjMv7Hf8x8Nt6o
         UuiY+QtZBX+M6BkjgaCEkLC0jDDM5J8XI81yLtBHlBnF6zv09wC5A2rDI7HcQ7QtxYoX
         2Uf79pOY4IDHdG9N1K491ggAk/PnxMg3J2s4cJ0uMY3Bx9OeuykzD2E6DV0AI7he/ls0
         RTgA==
X-Gm-Message-State: AOJu0YzIgyfg9G4D8sobCzj9ZCOB3SaNfW4Xo1Av0yf2ESabzi6XmusV
	sXBKyU5WuUAtYhcVW3AQau361VqYmiB/ctRz0EsdvcbkrHtBOD+3osRHpWqnzd/AunGvo+fpq/D
	qyF3ryy6vMX5zIY6DvQOadju/lERVw4aOYQ==
X-Received: by 2002:adf:d1ef:0:b0:32f:7db1:22fb with SMTP id g15-20020adfd1ef000000b0032f7db122fbmr9271954wrd.28.1698816673485;
        Tue, 31 Oct 2023 22:31:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtWRpcLI16VN5Ux9IspPPKzyjnqN3HCnnk68/8AxRn9MFqTqime86t3bfejQ9XytDILTmVmQ==
X-Received: by 2002:adf:d1ef:0:b0:32f:7db1:22fb with SMTP id g15-20020adfd1ef000000b0032f7db122fbmr9271942wrd.28.1698816673121;
        Tue, 31 Oct 2023 22:31:13 -0700 (PDT)
Date: Wed, 1 Nov 2023 01:31:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231101012540-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB54815B589B8F5489FB493465DCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <9604eb82-8efd-46cd-8b15-90fc637eff0c@intel.com>
 <PH0PR12MB5481E6F72E2F15AC88E6E24ADCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <09996f68-2831-49b0-a403-1ea061bea6eb@intel.com>
 <PH0PR12MB548147B94D76EF02EF42A9B1DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <341b7a16-6927-412e-8a22-4841cd419314@intel.com>
 <PH0PR12MB54813BF8D0F6282A1932EF99DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <640cc639-6065-4828-ac81-0cc809aff293@intel.com>
 <20231031054617-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54806512D1395AB39C59B821DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM8PR12MB54806512D1395AB39C59B821DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Wed, Nov 01, 2023 at 02:54:47AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, October 31, 2023 3:44 PM
> > 
> > On Tue, Oct 31, 2023 at 05:42:29PM +0800, Zhu, Lingshan wrote:
> > > > Your answer is not relevant to this discussion at all.
> > > > Why?
> > > > Because we were discussing the schemes where registers are not used.
> > > > One example of that was IMS. It does not matter MSI or MSIX.
> > > > As explained in Intel's commit message, the key to focus for IMS is "queue
> > memory" not some hw register like MSI or MSI-X.
> > > you know the device always need to know a address and the data to send
> > > a MSI, right?
> > 
> > So if virtio is to use IMS then we'll need to add interfaces to program IMS, I
> > think. As part of that patch - it's reasonable to assume - we will also need to add
> > a way to retrieve IMS so it can be migrated.
> > 
> > However, what this example demonstrates is that the approach taken by this
> > proposal to migrate control path structures - namely, by defining a structure
> > used just for migration - means that we will need to come up with a migration
> > interface each time.
> > And that is unfortunate.
> >
> When the device supports a new feature it has supported new functionality.
> Hence the live migration side also got updated.
> However, the live migration driver does not have to understand what is inside the control path structures.
> It is just byte stream.
> Only if the hypervisor live migration drive involved in emulating, it will parse and that is fine as like other control structures.

The point is that any new field needs to be added in two places now and
that is not great at all.

We need a stronger compatiblity story here I think.

One way to show how it's designed to work would be to split
the patches. For example, add queue notify data and queue reset
separately.

Another is to add MSIX table migration option for when MSIX table
is passed through to guest.

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

