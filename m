Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D26B4EC647
	for <virtio-comment@lists.linux.dev>; Mon,  7 Sep 2026 14:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789751; cv=none; b=LpuLzPT/yhIBjGpasTtwS/P7cD/C+UE2zv/DUCKUmUO2LhDSOBuYEQ4w9d5s1C69FLa8C/iQwOfvq9SAy3SJZQdt/9PjTnwcsecvhoGrCeoauYaZpj+tPgd8ytyyawo9DoNnkJOEhLsEaFUkfz458QO4QEZJtBVm+QcunsLQBlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789751; c=relaxed/simple;
	bh=e8dDbfMJ9MNq0Ig2xsrIJcfyx6yMZeL4ihSZP4ni1IA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=p4pu8izYC5gJgHXx4COyn0Rra+I9Pc3XiDaXwKDfc2rNGMKHE/pOo1ySmQTUAfA13kZbCI/oNiMp9cY9zJki/Ny5fCidOYJxru/a453pXx+V8lWAP9cTLyubvAsYhzT3+XWUMRpzbM7GP4RYfNer5Mcl4Csrmajy0Jo6iR3E9O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b5aTK9pr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b5aTK9pr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788789749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6NqrdgPYPlN3Dfxxot0SzYdwMk/Nd4Js7t9FGo2soQs=;
	b=b5aTK9prFjIbH+uR14lvGwm2cYY8KQn+r7N7YBODYKtC2D1mOo99Kqz8AUnyWlZf9G8aSN
	+f3SfAatUcWc6S3DZMcJLLFFwOaMrgJ44QAX+Iq19nVkHIoC8XI9R0t7WVFmqx1CPk6cWY
	c6Pd/B1PbhnxE7gPrktNxcAqyOK9HTw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-30-Zm9ivihrNwelExYPcKUZaQ-1; Mon,
 07 Sep 2026 10:02:27 -0400
X-MC-Unique: Zm9ivihrNwelExYPcKUZaQ-1
X-Mimecast-MFC-AGG-ID: Zm9ivihrNwelExYPcKUZaQ_1788789746
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7E8FB19541BE
	for <virtio-comment@lists.linux.dev>; Mon,  7 Sep 2026 14:02:26 +0000 (UTC)
Received: from localhost (unknown [10.44.32.28])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DAD19180049F;
	Mon,  7 Sep 2026 14:02:25 +0000 (UTC)
Date: Mon, 7 Sep 2026 15:02:24 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH 1/1] device-types/blk/description.tex: Allow longer
 device IDs to be returned
Message-ID: <20260907140224.GQ1436@redhat.com>
References: <20260906145444.127570-1-rjones@redhat.com>
 <20260906145444.127570-2-rjones@redhat.com>
 <20260907033334-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260907033334-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vjHSHyHLNRnPS4yLdHUnyO4XNI_wXW8twMP14lLrc70_1788789746
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 07, 2026 at 03:56:56AM -0400, Michael S. Tsirkin wrote:
> why 247? It feels like a lot, especially given we are padding. I'd say
> 128 maybe.  This way it fits in a single pci express packet on most
> systems.

virtio-scsi supports, at least in theory, 248 bytes, see:

https://gitlab.com/qemu/qemu/-/blob/cacd3462963a0a4f5bab4263ce79c2aa4b32692d/hw/scsi/scsi-disk.c#L708

This is chosen because of the maximum page size of a SCSI VPD (256)
minus the 8 bytes used for the header in VPD page 0x83.

Windows supports up to 128 "characters" and does support Unicode:

https://learn.microsoft.com/en-us/windows-hardware/drivers/ddi/storport/ns-storport-stor_serial_number

Although ...

> And as long as we are relaxing things, let's allow unicode?

... I feel we're just going to be introducing a world of pain by
trying to support Unicode, and I think anyone trying to use Unicode
serial numbers is doing it wrong.  Or anything outside numbers,
letters and dashes TBH.

Serials that I actually care about for my use case (converting from
VMware) are written as 32 hex characters, which VMware refers to as
"UUIDs" (they are actually encoded in binary by pvscsi but that's not
relevant here).

I think we could choose 247 or 248, but recommend that serials never
exceed 128 characters if implementers are concerned about
interoperability issues.  We still want to permit virtio-scsi serials
to be compatible with virtio-blk which argues for the larger sizes.

247 has the minor advantage that the response is always NUL-terminated.

> > +VIRTIO_BLK_T_GET_ID fetches the first 20 bytes of the device ID
> > +string.  If the ID is shorter than 20 bytes, then the response is
> > +padded with NUL bytes so its length is 20 bytes.  (Note that if the ID
> > +is 20 bytes or longer, this means the response will not be NUL
> > +terminated.)
> 
> Why first specifically?

For backwards compatibility (assuming I understand the question).
qemu's current behaviour is to truncate.

> > +Device drivers MAY choose a mechanism to opt in to longer device IDs,
> > +to prevent existing guests from breaking when they see a longer
> > +(non-truncated) device ID.
> >  In this case a guest which has not opted
> > +in will continue to use VIRTIO_BLK_T_GET_ID and ignore the complete
> > +ID.
> 
> But we don't know that the first 20 bytes are unique or descriptive
> enough.

Sure, in fact we know it is _not_, which is exactly the reason to
introduce the longer serials.

I'm preparing a follow up which I'll post shortly.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org

