Return-Path: <virtio-comment-return-8237-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F80C4167B
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 10:25:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4696926A42
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 10:25:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 303E7986A81
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 10:25:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 167709867FA; Tue,  7 Nov 2023 10:25:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 050159867FB
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 10:25:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Qa8Gh5i_M1-iBPH3eFR_4w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699352725; x=1699957525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpjHZ2hMoJnACid/KSdDeoTaPPXabhNypigYa5r8BMc=;
        b=VUayFYCSbZAi/825LcCpdlqMWD0a554Gum9ID9XOek11z+T0krWdoio8d0j2hoaNbx
         0xtwtm1gDPekPILgCUMd8ZpEngypaDiHghwAaDCkOcNNNTMpj2N9DT7wOwtOvhgVz1a1
         8ecR63jf5Ks4Azb5s0+y49eGnBaJi7R2H4bqDuFl6zSeodF0dk/viqK5bL/7tpMfZQnf
         nrX346WlBgNb+MwA6GNCOIrc/9OhnLvJXdnHeXa/cQQEYwwY7nXN3fR1mVByzRxNc9VC
         ox6QF9Bh7L1LPCVZZeCqZaewrnDa3VNNY1Xqf0JBUKpOUidLO/+b19CNP+QuAjQMN+kO
         0DoQ==
X-Gm-Message-State: AOJu0Yw/j4Ft+9jt2Kh9LatlOJCG38GYXmKLcKkWNsPdeko9JeUpA7ut
	hrs871Ok9s6h3rOp02OXKMbGxn3GfATnqA5b3qgZhSF4ifdpC00UZdmsLPfi+wBq5+Le4SwY8OT
	GJ5ZcG4QYbUMaru02PVdgGvPwwWM2EKPVcg==
X-Received: by 2002:a5d:6dad:0:b0:32f:762f:7f9f with SMTP id u13-20020a5d6dad000000b0032f762f7f9fmr24891239wrs.16.1699352725330;
        Tue, 07 Nov 2023 02:25:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZXGj/samoDq8Iyp6tsMoYiRAedKmImhG+kEXG0DZZtoiaCIT8LNG+I95iQB48ltRHD+BwAQ==
X-Received: by 2002:a5d:6dad:0:b0:32f:762f:7f9f with SMTP id u13-20020a5d6dad000000b0032f762f7f9fmr24891225wrs.16.1699352724939;
        Tue, 07 Nov 2023 02:25:24 -0800 (PST)
Date: Tue, 7 Nov 2023 05:25:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20231107051012-mutt-send-email-mst@kernel.org>
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

Parav, Lingshan can we please stop the "what is pass through" arguments?

I think thatthe term is vague, as
(almost?) no hypervisor passes all accesses without exemption through.
And the fact you are speaking past enough other on this subject
for how long now? seems to demonstrate I'm right.

Describing migration in the spec as opposed to leaving it up to
hypervisors seems valuable at least to me since historically hypervisors
did such a bad job of it. So I personally feel it's nice if it's there,
and the SUSPEND bit only works after DRIVER_OK. So that's an example
argument that makes sense to me.  But number of layers involved in control
path seems completely irrelevant to most people. *That* is an nvidia
thing, something very specific about vfio and vdpa and whatnot.
Nothing to do with the spec, wrong list for this.


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
> 
> As you know I am just a Junior Engineer in Intel, not like you a Senior
> Principle Engineer who has spent many years and
> have developed knowledge in this area. So I am quite technical focusing,
> they are all technical discussions till now.

It looks more like a passive-agressive flamewar from the side.
So maybe try to see other's point of view. I asked what's the advantage of
admin vq thing for migration and you said "it's an nvidia thing".
And when people try to point them out to you, you go well tough.
Maybe but we are wasting time here.

> We always welcome collaboration, remember Jason has proposed a solution to
> build admin vq based on these basic facilities,
> and I am fully agree on his proposal.

I didn't see anything specific frankly, I can easily see how Parav could
get mad if he posts a reasonably fleshed out patchset (which admittedly,
needs work with wording etc) and instead of review gets back
"rework this on top of these basic facilities which we don't yet know
how they will work but maybe will". We'll be stuck in this loop for
how long?


> > At one point I may probably stop responding to your comments that repeatedly says:
> > 
> > "Go read QEMU code, Do you know what is PASID?, Do you know num_queues, Go read PCI spec"...
> With all respect, you should do these because they are text book knowledge.
> > 
> > Taking deep breath now to do some productive work in TC...


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

