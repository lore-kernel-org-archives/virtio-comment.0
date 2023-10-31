Return-Path: <virtio-comment-return-8064-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AF3C4332F
	for <virtio-comment@archiver.kernel.org>; Tue, 31 Oct 2023 10:14:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 538B52AEEF
	for <virtio-comment@archiver.kernel.org>; Tue, 31 Oct 2023 10:14:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2CC62986B73
	for <virtio-comment@archiver.kernel.org>; Tue, 31 Oct 2023 10:14:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1227F986B69; Tue, 31 Oct 2023 10:14:24 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 023FA986B6A
	for <virtio-comment@lists.oasis-open.org>; Tue, 31 Oct 2023 10:14:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: ndqh-xxsOEqdRz11ILEfyw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698747258; x=1699352058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoTJi0MB1U/Cce0U1kOjDjbTUICwcIS6frTDc5+97uc=;
        b=FhhK8L6FFLF8PkgtmlruXvzMjr0wBB2aTz+BjKcMZV4E6nyLA4zcugqU5bz3gmIKR3
         wSwBwJGnzsdt/JZ6iVAyBDxbPVJFC+0VGvBnoF2o5qAdiXNlYcjrKkgC9X0yUUQPqH72
         u+mMorwP+8bOmemQZUEtgBW9vKcckBF05eOPBiq5hkNpsB6eC4DGQJCVaQJzvpmMUAbB
         bCF/hVdXmBgnnK9ecuwY4RMGYge7j0ml0aXiRKG0XAK4DItHxvKngWWsAIu7fDPHN6Bo
         cFd/3WzlmditAuk8Nm2weKgqXNOz+qOBuCEnpGOHbpoSQwwKEF+A9JnK3RyWFdqPSHFN
         Ys0Q==
X-Gm-Message-State: AOJu0Ywgih+j1hHFO158hp0wApdjJsEUwgWbsPhBdNDVo836q8hqShhj
	HWKJ+JaVAc3hzlWykCVLUNG+HsOzcALnE7kfLj4FAq/RhejoSBsGkbg/EDPQTYmzPz9/RtRDDQS
	8JGwGcl3DfONwdEd6/5Y7kTpXHAHwJWC/Eg==
X-Received: by 2002:a05:600c:4751:b0:401:bdf9:c336 with SMTP id w17-20020a05600c475100b00401bdf9c336mr10796256wmo.27.1698747257821;
        Tue, 31 Oct 2023 03:14:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtSxhKDhCLva7tAqg8etlGsheU9/35OVAwSYhywoHJMYrk3c3h0X+BlQBoOhqZPPbu1X470w==
X-Received: by 2002:a05:600c:4751:b0:401:bdf9:c336 with SMTP id w17-20020a05600c475100b00401bdf9c336mr10796239wmo.27.1698747257470;
        Tue, 31 Oct 2023 03:14:17 -0700 (PDT)
Date: Tue, 31 Oct 2023 06:14:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231031054617-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB5481033BB7C0BCABAE329B13DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f9a604b2-7bc9-49ce-bd28-59909f0a5fec@intel.com>
 <PH0PR12MB54815B589B8F5489FB493465DCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <9604eb82-8efd-46cd-8b15-90fc637eff0c@intel.com>
 <PH0PR12MB5481E6F72E2F15AC88E6E24ADCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <09996f68-2831-49b0-a403-1ea061bea6eb@intel.com>
 <PH0PR12MB548147B94D76EF02EF42A9B1DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <341b7a16-6927-412e-8a22-4841cd419314@intel.com>
 <PH0PR12MB54813BF8D0F6282A1932EF99DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <640cc639-6065-4828-ac81-0cc809aff293@intel.com>
MIME-Version: 1.0
In-Reply-To: <640cc639-6065-4828-ac81-0cc809aff293@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Tue, Oct 31, 2023 at 05:42:29PM +0800, Zhu, Lingshan wrote:
> > Your answer is not relevant to this discussion at all.
> > Why?
> > Because we were discussing the schemes where registers are not used.
> > One example of that was IMS. It does not matter MSI or MSIX.
> > As explained in Intel's commit message, the key to focus for IMS is "queue memory" not some hw register like MSI or MSI-X.
> you know the device always need to know a address and the data to send a
> MSI, right?

So if virtio is to use IMS then we'll need to add interfaces to program
IMS, I think. As part of that patch - it's reasonable to assume - we will
also need to add a way to retrieve IMS so it can be migrated.

However, what this example demonstrates is that the approach taken
by this proposal to migrate control path structures - namely, by
defining a structure used just for migration - means that we will
need to come up with a migration interface each time.
And that is unfortunate.

Compare to the trap and emulate approach for config space and we don't
need a new interface, we just make each field R/W.
So I feel this is something to think about, and address.
Ideas?

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

