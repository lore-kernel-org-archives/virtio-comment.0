Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA39519904
	for <virtio-comment@lists.linux.dev>; Tue,  8 Sep 2026 09:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860140; cv=none; b=ENFRhF4N8vONaQkTnbu6ztS7YpKab1kO8IWNbCG6MH8OCVv/iDgyNoI+iBtbLptuEaQ8/d6WPhX90sGnVwSueOoYDYeKfzsY9M7eG3qwUjE6D2+SG32WGzDv528w+wB5S+/i1yO5KSmBUqOayqxOTFdefWoDLLy+n6i0UH1//x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860140; c=relaxed/simple;
	bh=JiIPsB5JB5R07mzt4gR8BLGGMsEjNxj02M+AoK4hkuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=pC8zolduGTBb2EXwTdcV0o8PXRqmIynCoGxdCt1g1vV9yZYN/ZtDpR7l0iWhyvl+HmHXwaZdREmWTMiQPldXdex2q9+f2S5OqcWYiA4suxsqxeh1fu69iNqTSOzJjFJ4rxo6UFKQDIYHcMbXaIcBuCYW7/ydVd40Ju1Z2oEnJL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aTumyz/p; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aTumyz/p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788860138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GdO5asdAq81ic6jSfCoD2PWMPjinIE2dZGC+Pjs0NWk=;
	b=aTumyz/p9p5+2FscHj3zZ1nMfGcaCXl0snOELrFd5tJ64PES8vVPLg94Q1n4Nzf1PIuE1p
	EAc2XbsGaQts2tTMXMHAsZmPt4z5sFzaaR9Z10qsBr812Bwex9deN7yElEwArW6UmBFMxs
	c5M8tE5ECYZbevYR58Ef74TOVTdi6D8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-185-_8c5tCMhNXaxLqvzxbp5gw-1; Tue,
 08 Sep 2026 05:35:36 -0400
X-MC-Unique: _8c5tCMhNXaxLqvzxbp5gw-1
X-Mimecast-MFC-AGG-ID: _8c5tCMhNXaxLqvzxbp5gw_1788860136
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ED74E1953990
	for <virtio-comment@lists.linux.dev>; Tue,  8 Sep 2026 09:35:35 +0000 (UTC)
Received: from localhost (unknown [10.44.32.28])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 734021956049;
	Tue,  8 Sep 2026 09:35:35 +0000 (UTC)
Date: Tue, 8 Sep 2026 10:35:34 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH 1/1] device-types/blk/description.tex: Allow longer
 device IDs to be returned
Message-ID: <20260908093534.GT1436@redhat.com>
References: <20260906145444.127570-1-rjones@redhat.com>
 <20260906145444.127570-2-rjones@redhat.com>
 <20260907033334-mutt-send-email-mst@kernel.org>
 <20260907140224.GQ1436@redhat.com>
 <20260907123437-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260907123437-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h_OlKLqzM_L4VYfqgP13PzORFcvmnsH_MA1e8lLkvfE_1788860136
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 07, 2026 at 03:27:25PM -0400, Michael S. Tsirkin wrote:
> On Mon, Sep 07, 2026 at 03:02:24PM +0100, Richard W.M. Jones wrote:
> > On Mon, Sep 07, 2026 at 03:56:56AM -0400, Michael S. Tsirkin wrote:
> > > why 247? It feels like a lot, especially given we are padding. I'd say
> > > 128 maybe.  This way it fits in a single pci express packet on most
> > > systems.
> > 
> > virtio-scsi supports, at least in theory, 248 bytes, see:
> > 
> > https://gitlab.com/qemu/qemu/-/blob/cacd3462963a0a4f5bab4263ce79c2aa4b32692d/hw/scsi/scsi-disk.c#L708
> > 
> > This is chosen because of the maximum page size of a SCSI VPD (256)
> > minus the 8 bytes used for the header in VPD page 0x83.
> 
> Can I see a spec which says that is the maximum size?

I don't think virtio-scsi is following a spec, but it's clear from the
source code that the limit is 256-8, see the link above.

[...]
> > > > +VIRTIO_BLK_T_GET_ID fetches the first 20 bytes of the device ID
> > > > +string.  If the ID is shorter than 20 bytes, then the response is
> > > > +padded with NUL bytes so its length is 20 bytes.  (Note that if the ID
> > > > +is 20 bytes or longer, this means the response will not be NUL
> > > > +terminated.)
> > > 
> > > Why first specifically?
> > 
> > For backwards compatibility (assuming I understand the question).
> > qemu's current behaviour is to truncate.
> 
> That's just a qemu command line quirk then.
> At least from spec POV it isn't - the id must be <= 20.

Isn't the virtio spec also there (partly) to clarify and formalise
what existing implementations actually do?  qemu truncates.
Firecracker truncates:

https://github.com/firecracker-microvm/firecracker/blob/7699746649826d1dfcdde626b3131bac08f28e0d/src/vmm/src/devices/virtio/block/virtio/device.rs#L159

libkrun seems to be using the same code as Firecracker, so it also
truncates:

https://github.com/libkrun/libkrun/blob/413a011760b7ee61493fb0073f7810319ca6a181/src/devices/src/virtio/block/device.rs#L170

I have a v3 which considerably simplifies the specification &
implementation which I'll post very soon.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v

