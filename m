Return-Path: <virtio-comment-return-7731-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3EDCDB483
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 09:01:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 168ED157EE6
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 09:01:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EC54698648C
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 09:01:06 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D74BC986412; Mon, 16 Oct 2023 09:01:06 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C76E698643F
	for <virtio-comment@lists.oasis-open.org>; Mon, 16 Oct 2023 09:01:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: m7rQ-q5kO1OfpV3FHfLimQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697446859; x=1698051659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omhP0pqdjvnCm5BoCYMw5bTM0js/ujkFqeqLa1paoUA=;
        b=e84C2FPYvTz8zGpcbEg9hsbODDp276OkK8imfICQxIc+BbGTbwbRegj0j6ZiZPjYJR
         7Y6Vxm+GGTopf9vBy9aZqQgM+S/uW3xMkE8tcnNakwnPM+OCtzagi5C30PIugcZF46aH
         9rZabPX92Xjb2gnV1yW2T+RyKzQLZo0GtEIlfm7zF33VhP0G7rHJh8xZXn6KYowlbbP5
         PBTozacS2Axv3U/a5DMa+OAAjJIkxS5fu2q1yk1fZYnuu2fykhP31Cv09lIsY6vMisPA
         GdZaSyfHu7k8nXy10xtcvCxCUQGZk59Uu8eTpm16ckUgunw3Cs76xrYauH85pzKpeTev
         EYwg==
X-Gm-Message-State: AOJu0YyHCh/yCKfuSH72mVIqwdLr/o0wDLU1Rkn5hrGQbr2ay+e4oy7Q
	/BiffEbRPrS0oxMfmjpLYrmwnRMTgopzI7p4/WYdxvOvomUG3aY8g61T6pmvSIN8+iCS1KqjS0o
	0smApNS/+uE5HEVEjYP4sGesKa0CIIqDRRQ==
X-Received: by 2002:a1c:7414:0:b0:405:82c0:d9f3 with SMTP id p20-20020a1c7414000000b0040582c0d9f3mr29479264wmc.30.1697446859184;
        Mon, 16 Oct 2023 02:00:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkI0sRbgOaH2OBDVNmrYe5PB/erfGrE3AeAnsw3bGw2UTZxLoH8gM3p1nWOf5vqw8ca1Csog==
X-Received: by 2002:a1c:7414:0:b0:405:82c0:d9f3 with SMTP id p20-20020a1c7414000000b0040582c0d9f3mr29479248wmc.30.1697446858874;
        Mon, 16 Oct 2023 02:00:58 -0700 (PDT)
Date: Mon, 16 Oct 2023 05:00:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231016045226-mutt-send-email-mst@kernel.org>
References: <DM8PR12MB5480E0F15A1BBDD745EE3AF4DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <25375529-9c40-9ea9-692e-f557c514c72f@intel.com>
 <PH0PR12MB54812E59B581546FFB118F3FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f875fa3b-4b33-71c2-e612-bc2a674a1e59@intel.com>
 <PH0PR12MB548171A06CCE458C913E4961DCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <97aa9108-0715-2483-f5cf-02698c745d60@intel.com>
 <PH0PR12MB5481F4F3B4FADD79770ADEA6DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <4a8bf09e-9aa3-4aec-a20e-8c92f3da3d3c@intel.com>
 <20231013072659-mutt-send-email-mst@kernel.org>
 <5addecaa-31f3-457d-a950-7bed8c970e80@intel.com>
MIME-Version: 1.0
In-Reply-To: <5addecaa-31f3-457d-a950-7bed8c970e80@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Mon, Oct 16, 2023 at 04:41:46PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 10/13/2023 7:28 PM, Michael S. Tsirkin wrote:
> > On Fri, Oct 13, 2023 at 05:06:02PM +0800, Zhu, Lingshan wrote:
> > > Hint: how do you define device context for every device type, e.g,
> > > virtio-fs.
> > > Don't say you only migrate virito-net or blk.
> > Indeed. I don't think anyone can avoid either defining that or
> > leaving that completely up to implementations and just hoping
> > they don't miss anything. Given the choice I'm definitely for
> > defining. Each device must grow a "migration" section documenting
> > the context.
> > 
> Yes, I agree, so let's implement a stateless live migration first.
> 
> Thanks,
> Zhu Lingshan

Not sure what is stateless migration - I don't see how
you can both agree and say let's not define how to migrate state.

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

