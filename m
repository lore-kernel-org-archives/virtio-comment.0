Return-Path: <virtio-comment-return-6969-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62F7C001E0
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:53:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4D5A333565
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:53:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2F22E98663F
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:53:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1A15798662A; Wed,  2 Aug 2023 11:53:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 06A3F986636
	for <virtio-comment@lists.oasis-open.org>; Wed,  2 Aug 2023 11:53:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: XEAAdzYnNdG03Ie73tZ0Qw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690977233; x=1691582033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMoymgPUbH7CqUneRI63M1GNCVGXao5kMDQOEINTWgg=;
        b=cSYHTYNK6LuD/FcYPPvqvsh0PD5KOVTG9F9uI5w0wwhMjayz5m6/CXIMFwvuA26JAm
         qBUOuMrLLYUqKwetFqHU6/KERiAo/k+g6c48hMmoBHiYYQDw6tfmvm6eLVkruUrtYai0
         Z6eGwv0i3Bgr20d/1y5btxawIdPT8pm6TIK8bwm4gg7mmv1TEH9lLIeqqt9XjMUs8F5i
         GbBsTHqYWtrzGUARASUXWvCXpbVh1WSgyPLLYcl/y08X8r7sq9MQlXbEH3AqRS1to/OD
         4ZzmDiCn9izZLJVCjjy+b9CA1HHAwVxIS/XDM9YJBJsnam9KxVY3dBCoJ940UzpQdzPW
         aOuw==
X-Gm-Message-State: ABy/qLbrV0ulcqAAcRkG+XCMDEypQ3w3ElSWfPSA8CXSca59uO2GEHfz
	IK47F5OGQdqoIVCJh+QYnRWMtZUmZZ86SHs02l8owxvofNr2UUzt1nX5cHjqqvzs+O2NU4mQMoU
	fLXOqGyrDlvgPp7JGsdx07jmdUhnFuLbBBA==
X-Received: by 2002:a17:907:60c7:b0:994:542c:8718 with SMTP id hv7-20020a17090760c700b00994542c8718mr4538402ejc.76.1690977233098;
        Wed, 02 Aug 2023 04:53:53 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGexGcWthZ6x+gy7wliWpt6MtSKUFtCOt1RRm6wYLzPC2hj/75esldv05FCSy9ur5RXGoAcbg==
X-Received: by 2002:a17:907:60c7:b0:994:542c:8718 with SMTP id hv7-20020a17090760c700b00994542c8718mr4538391ejc.76.1690977232787;
        Wed, 02 Aug 2023 04:53:52 -0700 (PDT)
Date: Wed, 2 Aug 2023 07:53:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>
Message-ID: <20230802075306-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB54818D33A150A01DACF3BF74DC0AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230802000955-mutt-send-email-mst@kernel.org>
 <3b88c1fe-a5c8-7bc3-b30b-5babe741ffb9@intel.com>
 <PH0PR12MB54813732BE7EA68DC440D981DC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <ab1aec70-2016-dbdc-3707-c95b185dc1e6@intel.com>
 <PH0PR12MB5481E0E5AFEEEAA10FDBEFDADC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230802073108-mutt-send-email-mst@kernel.org>
 <DM8PR12MB548060C7A27EFF9719FD1987DC0BA@DM8PR12MB5480.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM8PR12MB548060C7A27EFF9719FD1987DC0BA@DM8PR12MB5480.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: proposal: use admin command (and aq) of the device to query
 config space

On Wed, Aug 02, 2023 at 11:51:21AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, August 2, 2023 5:05 PM
> 
> > > I said the opposite above, get and set is INBAND from guest driver to device
> > for PF, VF and SIOV through its own delegated resource.
> > > There is no AQ mediation from host.
> > > Hence, there is no risk.
> > 
> > I think there are different requirements from different people.  
> Yes.
> There are two requirements.
> 1. Build SIOV device that can live in hypervisor for having 1.x based PCI device in guest
> 
> 2. Build SIOV device ground up that does not need to have existing limitations of 1.x.
> 
> The transport VQ proposal 4 patches had heavy inclination for #1 without mentioning the real objective in the cover letter.
> I was proposing that when virtio builds SIOV device it should start with #2.
> Because #1 is sort of handled with sr-iov or vdpa already.
> 
> #2 is more critical to get it right, after SIOV R2 spec is defined.


Can't we address both? E.g. use a different group type.


> 
> > For example,
> > consider compatibility. I know it looks like super important right now, and we
> > should make it possible, but it's just like with legacy interface - looked very far
> > away when we introduced non-transitional, to the point where an option in
> > linux to disable legacy talks about "flying cars", but the flying cars are nowhere
> > to be seen and, while we are not where everyone can just drop pre-1.0 bits, a
> > bunch of people are using e.g. vdpa without any legacy, express devices in
> > qemu also disabled legacy, and so on.
> > 
> > 
> > --
> > MST
> 


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

