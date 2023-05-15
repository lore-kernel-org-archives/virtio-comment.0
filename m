Return-Path: <virtio-comment-return-5920-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD07C77B7D
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 20:29:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E3B252AD4D
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 20:29:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CD266986511
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 20:29:45 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B9459986243; Mon, 15 May 2023 20:29:45 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A107598650F
	for <virtio-comment@lists.oasis-open.org>; Mon, 15 May 2023 20:29:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: GMl7hJ8eOm-Ns7TxXRwmpg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684182582; x=1686774582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frk0bctUU6H3LDpCW1wUmc3+TUQ1hBtyMnit8bP6zl4=;
        b=cXYVD92eHcmy6Br1m6Icao+FjkBTXQKgfOYFlrHvY/DD33dPjSXyWcujfUBAr13tHl
         dQncPm2Ukj1LAkQ4TU9l2IBSoKxZlw9oJpr44vHBvNAtHlKDH3nsM0ooKfrr7PHBn9os
         SkQGvTSV/9T0IKJ2aj/+8blYYEcp+1p9FnlB1rIG57ht99rtdjxnRHxT01yMIUNCBwbu
         BA90rddz3AlMEfj0+h88Bzj4NsbpI5Q2q9H5KIKs0ICjQUUDmSfsyUEzN1NK6Y595bQf
         ccbzU+dM7A41EhTBeKG+7tZ0EAUPVtDLKSfRVwzXSb0vA0lYO6O3QIqgVRl9qDq3wc0l
         agcQ==
X-Gm-Message-State: AC+VfDyGfNOubvpAvaQDY5sqW4nOodLKBueVCJipdCbvDFtpeU+F0oKw
	Xh5lxxuw67l1hwLjcbrv9pu/EWI1lOVn6HYcHoCqciTcTr//A8n+nBeXSsnkuNC9zE07Cq7R9s7
	muDeR+tYH29kR1wupP/APz+WIK2IGZ+uMOg==
X-Received: by 2002:a05:600c:2210:b0:3f4:2174:b288 with SMTP id z16-20020a05600c221000b003f42174b288mr20602901wml.4.1684182581992;
        Mon, 15 May 2023 13:29:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4dnTHw41Opj7qH+2arG7IrDiC9n7lWjJyfgy143ttm7Xhiwl4SmWOAV5rD3oIFnAAYgLBA/Q==
X-Received: by 2002:a05:600c:2210:b0:3f4:2174:b288 with SMTP id z16-20020a05600c221000b003f42174b288mr20602893wml.4.1684182581663;
        Mon, 15 May 2023 13:29:41 -0700 (PDT)
Date: Mon, 15 May 2023 16:29:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, cohuck@redhat.com,
	david.edmondson@oracle.com, sburla@marvell.com, jasowang@redhat.com,
	yishaih@nvidia.com, maorg@nvidia.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com
Message-ID: <20230515155212-mutt-send-email-mst@kernel.org>
References: <20230506000135.628899-1-parav@nvidia.com>
 <20230507050146-mutt-send-email-mst@kernel.org>
 <71d65eb3-c025-9287-0157-81e1d05574d1@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <71d65eb3-c025-9287-0157-81e1d05574d1@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v2 0/2] transport-pci: Introduce
 legacy registers access using AQ

On Mon, May 08, 2023 at 12:54:55PM -0400, Parav Pandit wrote:
> 
> On 5/7/2023 5:04 AM, Michael S. Tsirkin wrote:
> > 
> > one things I still don't see addressed here is support for
> > legacy interrupts. legacy driver can disable msix and
> > interrupts will be then sent.
> > how about a special command that is used when device would
> > normally send INT#x? it can also return ISR to reduce latency.
> 
> I am not sure if this is a real issue. Because even the legacy guests have
> msix enabled by default. In theory yes, it can fall back to intx.

Well. I feel we should be closer to being sure it's not
an issue if we are going to ignore it.
some actual data here:

Even linux only enabled MSI-X in 2009.
Of course, other guests took longer. E.g.
a quick google search gave me this for some bsd variant (2017):
https://twitter.com/dragonflybsd/status/834494984229421057

Many guests have tunables to disable msix. Why?
E.g. BSD keeps maintaining it at
     hw.virtio.pci.disable_msix
not a real use-case and you know 100% no guests have set this
to work around some bug e.g. in bsd MSI-X core?  How can you be sure?



intx is used when guests run out of legacy interrupts,
these setups are not hard to create at all: just constrain the
number of vCPUs while creating lots of devices.


I could go on.



> There are few options.
> 1. A hypervisor driver can be conservative and steal an msix of the VF for
> transporting intx.
> Pros: Does not need special things in device
> Cons:
> a. Fairly intrusive in hypervisor vf driver.
> b. May not be ever used as guest is unlikely to fail on msix

Yea I do not like this since we are burning up msix vectors.
More reasons: this "pass through" msix has no chance to
set ISR properly since msix does not set ISR.


> 2. Since multiple VFs intx to be serviced, one command per VF in AQ is too
> much overhead that device needs to map a request to,
> 
> A better way is to have an eventq of depth = num_vfs, like many other virtio
> devices have it.
> 
> An eventq can hold per VF interrupt entry including the isr value that you
> suggest above.
> 
> Something like,
> 
> union eventq_entry {
> 	u8 raw_data[16];
> 	struct intx_entry {
> 		u8 event_opcode;
> 		u8 group_type;
> 		u8 reserved[6];
> 		le64 group_identifier;
> 		u8 isr_status;
> 	};
> };
> 
> This eventq resides on the owner parent PF.
> isr_status is read on clear like today.

This is what I wrote no?
lore.kernel.org/all/20230507050146-mutt-send-email-mst%40kernel.org/t.mbox.gz

	how about a special command that is used when device would
	normally send INT#x? it can also return ISR to reduce latency.



> May be such eventq can be useful in future for wider case.

There's no maybe here is there? Things like live migration
need events for sure.

> We may have to find a different name for it as other devices has device
> specific eventq.

We don't need a special name for it. Just use an adminq
with a special command that is only consumed when there is an event.
Note you only need to queue a command if MSI is disabled.
Which is nice.




> I am inclined to differ this to a later point if one can identify the real
> failure with msix for the guest VM.
> So far we don't see this ever happening.

What is the question exactly?

Just have more devices than vectors,
an intel CPU only has ~200 of these, and current drivers
want to use 2 vectors and then fall back on INTx since that is shared.
Extremely easy to create - do you want a qemu command line to try?

Do specific customers event use guests with msi-x disabled? Maybe no.
Does anyone use virtio with msi-x disabled? Most likely yes.
So if we are going for legacy pci emulation let's have
a comprehensive legacy pci emulation please where
host can either enable it for a guest or deny completely,
not kind of start running then fail mysteriously.


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

