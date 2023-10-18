Return-Path: <virtio-comment-return-7804-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A569CDB482
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 10:20:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F3170109D04
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 10:20:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D4E219868A0
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 10:20:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BD5EB986898; Wed, 18 Oct 2023 10:20:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DBB34986899
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 10:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: yWbA2apjPpeECjqo1G0XQQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697624382; x=1698229182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6eIDqTNgZ6stM+dmqWFfuYp47okjx6LvAGknX4ZR1uU=;
        b=Rf1jCeHEa9ZuRqWNMRnA2cwv7nuVfIq6BCZXAI9gSRHvAxIbngK3yUZMKFKDe7DpTa
         e8XU6Yq9rKuSHyz0mCOImEMbdxTI/8x7VHb012j4MKazuXRc/JEN9UnTv1VpPhMEfsUL
         jDGiL8MBdIfFL0tWqJQQiMQL5ab3zLZ/+oabs27qavfgUw1xF52OnawvpkY/aM2n2OIT
         VnilCg9FadhVtqkMbbt26kJ57OpgaV4Nup5k8G3uG1K7JiDGe6RsHirPF2bzzrzMdSeV
         U8sfGLYb+mMEXwatfsf9mk945xEubl4DI2xXEovIIXEAhCmBP/WSio6YYnuTdowHYHi/
         n4gQ==
X-Gm-Message-State: AOJu0Yw7TVLMEMmbM5dqfTOHvorHqrGOWE58z9dCPMrv5E98kT/8gLHA
	DOSXAgBSlR1nHX0yuxWKvYCVEgxT6VqTrHshzPX61ckVXa33VrOJXI8qHoLJWmsT5zgDzlPSTmC
	b72a4bY+ISWqObb/oSY7PXQ/BI1WlXfPBFw==
X-Received: by 2002:a05:6402:5186:b0:53e:3ba1:d40e with SMTP id q6-20020a056402518600b0053e3ba1d40emr3897494edd.26.1697624382591;
        Wed, 18 Oct 2023 03:19:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0uZbGcdwTXqLsjTfO5QVZdpoLnOxu8SAdXwpSYxIvAfZ9y5fQ/cXSRqFHRoO8hKgR2iXSpw==
X-Received: by 2002:a05:6402:5186:b0:53e:3ba1:d40e with SMTP id q6-20020a056402518600b0053e3ba1d40emr3897480edd.26.1697624382242;
        Wed, 18 Oct 2023 03:19:42 -0700 (PDT)
Date: Wed, 18 Oct 2023 06:19:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>
Message-ID: <20231018061343-mutt-send-email-mst@kernel.org>
References: <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
 <DM8PR12MB548029E1AAB8529339D22D4DDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEswD2XLjRNzyqo9M-yT77PsOJqJmDLxSKd2ZOgqLYjjZQ@mail.gmail.com>
 <PH0PR12MB548143D2AB83CA90E7F1C9D6DCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsk7ZgmWuqm9U_Tych8+Ceu7X9RymQASeSS_ayB2PGTgg@mail.gmail.com>
 <PH0PR12MB54817B050D97CC7123DE30ECDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEux-kXQ=d_6CVyfhNit4TMJ=V1p8C6XRDXhCLAJDD5kRA@mail.gmail.com>
 <PH0PR12MB5481CD04EF5122C041D63CCDDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEustM=iejjJhGz0DW1iT9qJpha4zLbMJ-cVO2VU4Kq2Kg@mail.gmail.com>
 <PH0PR12MB5481FD2FAFC2C58AE0E9A58BDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481FD2FAFC2C58AE0E9A58BDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Wed, Oct 18, 2023 at 08:16:01AM +0000, Parav Pandit wrote:
> > This doesn't happen yet. For example, a VF with adminq that can be isolated
> > with PASID makes some sense.
> PASID is for the process of user space.
> Kernel space do not consume a PASID.

It could if we need it to.

> Depending on the PASID can work for mediation approach only.
> Last I heard is the cpu or kernel took the support out of it as some special instruction did not work for that cpu.

Are you talking about ENQCMD things? That's nice but I don't think it's
necessary for isolation here.

...

> > The reason why I see it is different from FLR is that
> > 
> > 1) D3cold requires the VF to be off the power
> > 2) State transition might takes more than what FLR did, PCI seems only cover
> > the minimum delay but not maximum which may have implications for
> > downtime
> > 
> D3cold is not controlled by the guest driver.
> PM register can change D0 to D3hot.

It likely makes sense to document how all this interacts with things
like PM and other pci config. maybe you did in v2 didn't look at it yet.



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

