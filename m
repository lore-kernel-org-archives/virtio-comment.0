Return-Path: <virtio-comment-return-8385-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C85C47071
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 05:51:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3EE9A13246F
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 05:51:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 125E7986DDA
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 05:51:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id ED1F7986DD0; Thu, 16 Nov 2023 05:51:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DCB85986DD1
	for <virtio-comment@lists.oasis-open.org>; Thu, 16 Nov 2023 05:51:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: t3vzBXxIM2m8hlMo9ZbQuQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700113901; x=1700718701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUczTi2uLRkShwl+tX7P94lJgMk02OPcrB6c/WHIDpQ=;
        b=Wd615MbxLgDH1aMsIUUrRP01AlIVnVolJRzKclHkFxcNoT+shVGiv+q+oyUb/Wd+X4
         fN2eqmvkH8wYYEmOnhQvctaQjgWRKVyP3hlJRRropigT8hOFD2r0eiskQM8w426FZeTz
         kCNCXEadZNB29LCcId9oOH+VWa2KZoM6DXkCgwqgkl0DvjIxrasQiVFHsQBUDW99wQd6
         BfZY/OKJPKCw0WBj9K0iJ4NTymXU0pMlSkdfAjxBBdlOTNcPmjvxnJSgOZYfV+o2Wzvy
         6IpsXrS5h6fow+pAH6dsxwTzXpco4QX/3o4ayIJtdKyI7tZ8WLuExiN+UR1gm9Gb2Nz8
         Z8iQ==
X-Gm-Message-State: AOJu0YxMhyT5odwk4k8JAQn2Qcukuu8NPE4rdfnGIfeIndSNPKsaCcut
	lym0KJ+wdKVvI97vmaO7NIhK6Og+kx1L6CIE2Ngv5NXrlBdwMXhbKWmx3VD9vxv5b+U7GQe76Fd
	tDXOoSCinhATObhUse8Pz9O9dII3UVJGY/w==
X-Received: by 2002:a05:600c:45c6:b0:40a:4436:e037 with SMTP id s6-20020a05600c45c600b0040a4436e037mr10498680wmo.35.1700113900868;
        Wed, 15 Nov 2023 21:51:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMEQsJ9Yb5r26uv5usgaWw/jZ+XkpT79s9le3ePGyQTkW0LFzeCI8SwRmq+SrJVZsILjXMwA==
X-Received: by 2002:a05:600c:45c6:b0:40a:4436:e037 with SMTP id s6-20020a05600c45c600b0040a4436e037mr10498669wmo.35.1700113900518;
        Wed, 15 Nov 2023 21:51:40 -0800 (PST)
Date: Thu, 16 Nov 2023 00:51:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Message-ID: <20231116004037-mutt-send-email-mst@kernel.org>
References: <CACGkMEtFyH_wJAqTz=jwosVM-=SRuO+wpT7NM=Eod8ExsxfTsg@mail.gmail.com>
 <PH0PR12MB54814420718AB387C0C84C07DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com>
 <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <DM8PR12MB5480A4E02DF988BCDD16E7BEDCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsRjdg8-YN1GY1fyRHU8UvCthvDgBUzURmTVB4JdbFGZA@mail.gmail.com>
 <PH0PR12MB54810AFC15EAC51755CFC045DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtP+W4mdfn5PszoSHW3tNS+KPAMKXvJhpWKa_NchxVpZA@mail.gmail.com>
 <PH0PR12MB54815F616E0CF024927984C2DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54815F616E0CF024927984C2DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands

On Thu, Nov 16, 2023 at 05:29:54AM +0000, Parav Pandit wrote:
> We should expose a limit of the device in the proposed WRITE_RECORD_CAP_QUERY command, that how much range it can track.
> So that future provisioning framework can use it.
> 
> I will cover this in v5 early next week.

I do worry about how this can even work though. If you want a generic 
device you do not get to dictate how much memory VM has.

Aren't we talking bit per page? With 1TByte of memory to track ->
256Gbit -> 32Gbit -> 8Gbyte per VF?

And you happily say "we'll address this in the future" while at the same
time fighting tooth and nail against adding single bit status registers
because scalability?


I have a feeling doing this completely theoretical like this is problematic.
Maybe you have it all laid out neatly in your head but I suspect
not all of TC can picture it clearly enough based just on spec text.

We do sometimes ask for POC implementation in linux / qemu to
demonstrate how things work before merging code. We skipped this
for admin things so far but I think it's a good idea to start doing
it here.

What makes me pause a bit before saying please do a PoC is
all the opposition that seems to exist to even using admin
commands in the 1st place. I think once we finally stop
arguing about whether to use admin commands at all then
a PoC will be needed before merging.


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

