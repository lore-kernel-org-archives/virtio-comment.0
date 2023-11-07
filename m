Return-Path: <virtio-comment-return-8222-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70647C4332F
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 08:01:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BF341330A9
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 08:01:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 97EAB9867FD
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 08:01:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 835DC9867E8; Tue,  7 Nov 2023 08:01:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 736169867EA
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 08:01:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: qGM9WwlyOKSstagus1mUQg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699344113; x=1699948913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRbudZK4EGiV8kNe3uJ+bsANEq8aP5q5xkCNdswGUKU=;
        b=XmtRrkKUo71vh3JeWtaEwLGuyBX6rTyLf8aH8edI3tWm29+3t5H33rW1KXrMHGjDab
         U3D2aeFp4EhvDrNTyc4avpTXN4FbRH/9jZ87glZ6/8G1F3p3jkLLz8uOyqvE018ky5nZ
         B22ZhpM+modpgWimWBZyhtEi3T7KfUtof7MBWcDAcIE9tHt/Sylh9C7HMWOKkyiV6daj
         04Ay4dxOsZ37wAW6fFGqWs1gqTbCzzUxT8SisNNWZuZBEGaOvPwJGrd3cm5Q10+yGOkJ
         55hYfyqh/d3ZgF5DFLIyTS58jaMxKg/qh9L4x4bOjdzRwh9IGXXmUt9/N0pWxM9IFbPk
         6Fgw==
X-Gm-Message-State: AOJu0Yx+5GHFyYwplNvk6BY/x6XwCtvWdoWrWeLcocm/kU3gX1RLD27k
	/+oxJbECzk6+Z6Ui4g3+Zz090yx4skXcoS6IqWVgC0j6chbtTdMLMtoywhJIIvqzV4mcsyzvrmN
	4kiGY5Ad7tkxcTay5J13B33Dir8SpBLCiCA==
X-Received: by 2002:a05:600c:3b20:b0:404:757e:c5ba with SMTP id m32-20020a05600c3b2000b00404757ec5bamr1611205wms.26.1699344113466;
        Tue, 07 Nov 2023 00:01:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnSAA2/skVDKs97UagXOb36flFys5HMkv/bvML0BurTDM7UOFEbdICm89j5dhjIfKtMQ2hIw==
X-Received: by 2002:a05:600c:3b20:b0:404:757e:c5ba with SMTP id m32-20020a05600c3b2000b00404757ec5bamr1611182wms.26.1699344113012;
        Tue, 07 Nov 2023 00:01:53 -0800 (PST)
Date: Tue, 7 Nov 2023 03:01:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
	stefanha@redhat.com, virtio-comment@lists.oasis-open.org,
	parav@nvidia.com
Message-ID: <20231107023610-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20231103103437.72784-1-lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH V2 0/6] introduce basic facilities for virito live
 migration

On Fri, Nov 03, 2023 at 06:34:31PM +0800, Zhu Lingshan wrote:
> This series introduces basic facilities to support
> virtio live migration, includes:
> 
> 1)a new SUSPEND bit in the device status
> Which is used to suspend the device, so that the device states
> and virtqueue states are stabilized.
> 
> 2)virtqueue state and its accessor, to get and set last_avail_idx
> and last_used_idx of virtqueues.
> 
> 3)dirty page tracking


So looking at this from 100ft:
- SUSPEND bit looks like something that might have value as a generic
  component. For example, maybe for NUMA balancing we could suspend,
  quickly copy ring to a different node and resume.  However current
  restrictions make it very limited, e.g.  apparently you can't change
  config space while suspended.
  As another example, changing config while suspended might be
  needed e.g. for net announcements.
  Also, do we want to suspend individual
  queues then? what exactly happens with config changes while suspended
  that would happen otherwise is also unclear. Also as is, proposal is
  very light on detail. Other patches in the series make it look like
  there are more assumptions made about e.g. how vq enters the
  suspended state.

- virtqueue state proposal looks very vague. A couple of 16 bit indices
  are insufficient to fully describe internal vq state at an arbitrary
  time. Some assumptions seem to be made that make this possible and
  yes, these would need to be stated and/or lifted.
  Preferably lifted since another use-case proposed was debugging -
  you do not, while debugging, want to depend on device following
  a complex set of assumptions.
  
- dirty page tracking as described does not seem practical for
  many systems.  increasing page size x8 is just being nasty
  towards other network users. CAS + retry could be a solution,
  but this needs to be documented thoroughly then and it appears this is not what author expects to implement
  anyway - instead, there's an assumption that platform itself
  will support dirty tracking. By itself, this is not
  an impossible assumption - will possibly result in a cheaper,
  slower device. why not have an option like this?
  I would probably just drop it from this proposal completely.
  Also, tracking memory on the device means we'll lose state
  around reset. Solving that could be tricky. Finally,
  dependence on PASID can not be removed apparently.
  So maybe, people who want to track memory changes on the
  device itself should just bite the bullet and use
  admin vq in the PF.




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

