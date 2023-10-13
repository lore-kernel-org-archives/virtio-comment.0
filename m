Return-Path: <virtio-comment-return-7717-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B47CDB47E
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 11:50:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1252E2B019
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 11:50:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DCCC9986842
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 11:50:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BE125986836; Fri, 13 Oct 2023 11:50:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 11424986837
	for <virtio-comment@lists.oasis-open.org>; Fri, 13 Oct 2023 11:49:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: r9RukPTeNQGRiuLb-3VZRg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697197763; x=1697802563;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VXh28uRa7WhshhapTxab2OwiMZFgPpaUPMnQcres0LA=;
        b=pf3J6PSr9rdKrol5sDVOjH6ClDyYPalsrszHPmTLBCmMKhtWJUArIyox/20ML4G5CM
         XEap3C6qVxyJGgGXvvTj0KoH5dWjRiUdWrCed3MvjoOpu4ofSc7AyFXu0VjLqVL2IIbL
         kgwRAb2ivtKL0ZGhw3DTGYdVvZXD/Qo4J7heURdhqmS0NCRQkJZx9N0ZcT2wRayk7qjB
         gQ1OVTWajJ0mUVa2Crg+gqwqSYgfBXmeLjRUDH5Rf6a8oI5bgkXqBZvs1drlTW5ePlOy
         1fRYUO3r1iZxUaAY0b7CDlHD4Qs9ge/XIoekLwaEWTlpLS2cONd+l7JW8mLYeu3D4Sca
         oxaA==
X-Gm-Message-State: AOJu0YzUk08i6TFKYA6V+kcpTFyn/deo/k8HFNXlmhmlQxC9ZwRy37ZH
	hGr3sVMhqEZ3nGrnFegrPKez6ABEKgMa581kIZKr3Nxe6rnK7qmV851EAnHiAImQut3YIemLi9E
	AYD/KmfjFiBDvkO+uhjCUqcAxVrpyfIthNg==
X-Received: by 2002:a05:600c:2804:b0:406:44e6:cfd1 with SMTP id m4-20020a05600c280400b0040644e6cfd1mr22237827wmb.3.1697197763511;
        Fri, 13 Oct 2023 04:49:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKezMU30VJXqXd/0SsfuvUsDE/vsFCwWnQDhRF6Yb4gwLJCNR370Ul1HOA3/uIKdu748Ys2w==
X-Received: by 2002:a05:600c:2804:b0:406:44e6:cfd1 with SMTP id m4-20020a05600c280400b0040644e6cfd1mr22237809wmb.3.1697197763127;
        Fri, 13 Oct 2023 04:49:23 -0700 (PDT)
Date: Fri, 13 Oct 2023 07:49:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231013074226-mutt-send-email-mst@kernel.org>
References: <20231009121638-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480E0F15A1BBDD745EE3AF4DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <25375529-9c40-9ea9-692e-f557c514c72f@intel.com>
 <PH0PR12MB54812E59B581546FFB118F3FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f875fa3b-4b33-71c2-e612-bc2a674a1e59@intel.com>
 <PH0PR12MB548171A06CCE458C913E4961DCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <97aa9108-0715-2483-f5cf-02698c745d60@intel.com>
 <PH0PR12MB5481F4F3B4FADD79770ADEA6DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <4a8bf09e-9aa3-4aec-a20e-8c92f3da3d3c@intel.com>
 <PH0PR12MB5481F0C9549BFCD2EF1C175BDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481F0C9549BFCD2EF1C175BDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Fri, Oct 13, 2023 at 11:28:50AM +0000, Parav Pandit wrote:
> > >>>> inflight descriptor tracking will be implemented by Eugenio in V2.
> > >>> When we have near complete proposal from two device vendors, you
> > >>> want to push something to unknown future without reviewing the work;
> > >>> does not
> > >> make sense.
> > >> Didn't I ever provide feedback to you? Really?
> > > No. I didn’t see why you need to post a new patch for dirty page tracking,
> > when it is already present in this series.
> This is plain ignorance and shows non_cooperative mode of working in technical committee.


I personally think it's fine to have multiple proposals on the table.
For example, current Zhu Lingshan's patch is clearly incomplete without
memory change tracking.
Why shouldn't he post a patchset demonstrating
how that is supposed to work in his view?
I am personally interested in seeing how is that
supposed to work   - his latest proposal relies on migrating by
trapping memory accesses but DMA can't be trapped like this generally.

In the end we want something addressing all use cases though
and integrating reasonably well with existing ecosystem.

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

