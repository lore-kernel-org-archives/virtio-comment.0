Return-Path: <virtio-comment-return-8251-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B9EC4167D
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 12:01:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2BDEE2A83E
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 12:01:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 06E73986B5D
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 12:01:21 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E46F69867FD; Tue,  7 Nov 2023 12:01:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D4CE39867FE
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 12:01:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: jjDNf4sMNqKarI1z2oeWrw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699358466; x=1699963266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oCohfbgEiU1vPncC5x6153TGExiqKpMxIRUucrDeow=;
        b=IJ1SyVdho6Y62OoACSo9pxwq19/D5YycXA2BRr1fdL66J8A+ACOn0oqiXc763GfFbT
         RgvlfiuTW9EzLRUlTOICPEZ9OLVzv4b4oNR5R/IuYpnwT8Ls1T6MnclBpDe34csO5zzt
         fMpgk5PCiTDbkZWja7Fz3Q1AqllLbKa/9ZC/I8GxDrHzsdOSyGivtuA/UUGXr9o0E/BU
         eZ0GYGjiAVPFxzQU2itAj50T9gyAxWXAO6wChcS5T0MJ1arltQvtxEaS7HBTHkSwAv12
         jfquS8gzlgbjC7nq2lAYQy7rvvtP1VWAXOrAaFgE6nKV1/Hb5/c6Qgh/UmilxS5231dM
         CnTA==
X-Gm-Message-State: AOJu0Yw7Iat0FXBI4HWP2v8mAjCcfJXkadRyC9jFg2SZj7VqpPHCstaI
	zwXd4YlQ3xOBCk9V83c4LQ3dlMCwBm9wnXtiub6BoXVWeIj+yqsgZ3H/LcXJgHLeiBDyHLH7RUw
	52bVB0NEZVh+stxKnV+Dxnylt496HGAYPJg==
X-Received: by 2002:a05:6000:c8d:b0:32d:a292:66f7 with SMTP id dp13-20020a0560000c8d00b0032da29266f7mr19067627wrb.35.1699358466397;
        Tue, 07 Nov 2023 04:01:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9D7KffUkbmQPgXeO7LTcs2eDKzpzWLQ0kaqW7ckRgnWTFuDVh6hnxEoJmn9Soj0NgKOKX2g==
X-Received: by 2002:a05:6000:c8d:b0:32d:a292:66f7 with SMTP id dp13-20020a0560000c8d00b0032da29266f7mr19067605wrb.35.1699358465974;
        Tue, 07 Nov 2023 04:01:05 -0800 (PST)
Date: Tue, 7 Nov 2023 07:00:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20231107065729-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com>
 <PH0PR12MB54818179419B06412D7A9C84DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <445ff573-72c3-4fe4-9e07-e7fdd2dc5750@intel.com>
 <PH0PR12MB54818BAE4BD33983E6108FE5DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2615baa2-9450-4504-aa8a-e46fdbb332b8@intel.com>
 <PH0PR12MB54810847007367DD75FA3D60DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <431c0495-f0d9-46d6-8336-cc2bd293cc35@intel.com>
MIME-Version: 1.0
In-Reply-To: <431c0495-f0d9-46d6-8336-cc2bd293cc35@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty page tracking

On Tue, Nov 07, 2023 at 06:01:27PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 11/6/2023 7:13 PM, Parav Pandit wrote:
> > > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > > Sent: Monday, November 6, 2023 3:04 PM
> > > So, please no pass-through discussion anymore.
> > If you comment like this, nothing can progress.
> > 
> > What you are implying with above language is:
> > "hey a virtio can do live migration ONLY by creating vdpa device on top of ALREADY virtio device, and you get another virtio device by running through 3 layers of stack you get virtio device on other side!".
> I never say that right? I keep explaining how pass-through and "trap and
> emulate work", I even explained how PASID work.
> > 
> > Then for sure, I disagree to it for 100% for such a single-minded design.
> > 
> > At least I am trying to propose if a solution can work for generic passthrough where least amount of hypervisor mediation is done.
> > 
> > And an extension where hypervisor has choice to more medication layers as it finds suitable.
> > And if there are technical issues, may be two different interfaces or more admin commands needed for two modes.
> > The idea is to attempt to converge and discuss those details, not the opposite.
> > 
> > Your above comment shows a clear sign of non-collaboration to make both mode works.
> Well, I see you are emotional, please take a deep breath and calm down, to
> be professional,
> give yourself a break, and really not necessary to be mad at me.

You aren't just going to stop people being mad by telling them not to.
Try to figure out why did that happen.

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

