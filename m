Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2024E513567
	for <virtio-comment@lists.linux.dev>; Tue,  8 Sep 2026 10:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788864232; cv=none; b=JYwvCuUj4IcUhr+Bbge8yThlBKgMUUmwHvCL14lLHNI2QUp2MCN4S+DbpHY0eAQRPRtN1RfGf1DkLY2wk+H+7g5WUAXVE+FoAjMamL5omXVGdiGl+qHQVOwzEQ7Rrj5CCKTTUwe8ycKodLhdFg7wo5YeNp7BiYXF+uvf2cYbCQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788864232; c=relaxed/simple;
	bh=rBkJvMJrUzjOONV9iVbUVWQxi69l/q5BIS3sKvtNurg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ANspZy4Alml3iWzTPZEgpJA4kQJOMxfr6JLYKFasCb3klttlEw8OwJ/7Ly5soCSMEk/lfvZZezr0GB8pcmqcJTorUy1myxQd/1BmrdcP1/CNVOm5H/mrPb1ihorrhGXtoxuEMB7gc/3v8woFX3kCV8Uy1wXpceglMzX4JSbryNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a0HPe+zC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a0HPe+zC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788864229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ggk/gcxWgFjGUhs2XvcyjqcLNkIa4KV8TpOBoQZU5Ao=;
	b=a0HPe+zCR07xoofY4jefenTuOgp4ySa+Ywq4X83Si3BpkQvBQWFsCNrVo6uuAC0Ktg3yJl
	xRuEC4CAHQgHcHlsRwFORlZkynEOSAntt5il0tRHVD0eaek5R2bbCaO3gnNR+Q5tstS43W
	jRcmNOBgqMjVt+nyPslZbXDeWq91f+4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-638-XTTE1SfGNa2Bo7a8sgf0Vg-1; Tue,
 08 Sep 2026 06:43:48 -0400
X-MC-Unique: XTTE1SfGNa2Bo7a8sgf0Vg-1
X-Mimecast-MFC-AGG-ID: XTTE1SfGNa2Bo7a8sgf0Vg_1788864227
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3D7861933FB1
	for <virtio-comment@lists.linux.dev>; Tue,  8 Sep 2026 10:43:47 +0000 (UTC)
Received: from localhost (unknown [10.44.32.28])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 920F41956042;
	Tue,  8 Sep 2026 10:43:46 +0000 (UTC)
Date: Tue, 8 Sep 2026 11:43:45 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH 1/1] device-types/blk/description.tex: Allow longer
 device IDs to be returned
Message-ID: <20260908104345.GU1436@redhat.com>
References: <20260906145444.127570-1-rjones@redhat.com>
 <20260906145444.127570-2-rjones@redhat.com>
 <20260907033334-mutt-send-email-mst@kernel.org>
 <20260907140224.GQ1436@redhat.com>
 <20260907123437-mutt-send-email-mst@kernel.org>
 <20260908093534.GT1436@redhat.com>
 <20260908053922-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260908053922-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Lde2Pm05ifwE6RIZ9xeEAChPBf2Vmou4wJf00bUZFVw_1788864227
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 08, 2026 at 06:06:14AM -0400, Michael S. Tsirkin wrote:
> On Tue, Sep 08, 2026 at 10:35:34AM +0100, Richard W.M. Jones wrote:
> > On Mon, Sep 07, 2026 at 03:27:25PM -0400, Michael S. Tsirkin wrote:
> > > On Mon, Sep 07, 2026 at 03:02:24PM +0100, Richard W.M. Jones wrote:
> > > > On Mon, Sep 07, 2026 at 03:56:56AM -0400, Michael S. Tsirkin wrote:
> > > > > why 247? It feels like a lot, especially given we are padding. I'd say
> > > > > 128 maybe.  This way it fits in a single pci express packet on most
> > > > > systems.
> > > > 
> > > > virtio-scsi supports, at least in theory, 248 bytes, see:
> > > > 
> > > > https://gitlab.com/qemu/qemu/-/blob/cacd3462963a0a4f5bab4263ce79c2aa4b32692d/hw/scsi/scsi-disk.c#L708
> > > > 
> > > > This is chosen because of the maximum page size of a SCSI VPD (256)
> > > > minus the 8 bytes used for the header in VPD page 0x83.
> > > 
> > > Can I see a spec which says that is the maximum size?
> > 
> > I don't think virtio-scsi is following a spec,
> 
> 
> But you referred to SCSI VPD and said it has a limit of 256
> and an 8 byte header. I can't figure out where this is from?
> 
> > but it's clear from the
> > source code that the limit is 256-8, see the link above.
> > 
> > [...]
> 
> 
> Hmm. I see MAX_SERIAL_LEN which is 36? And  MAX_SERIAL_LEN_FOR_DEVID
> which is 20?

Indeed you're right ... and this is very confusing.

qemu lets you set both serial and device_id, eg:

$ qemu-system-x86_64 -machine accel=kvm:tcg -cpu max -m 4096 \
  -device virtio-scsi-pci,id=scsi0 \
  -drive id=hd1,file=$HOME/tmp/vms/rhel-10.qcow2,format=qcow2,if=none \
  -device scsi-hd,bus=scsi0.0,drive=hd1,device_id=ABCDEFGHIJ0123456789abcdefghij0123456789ABCDEFGHIJ0123456789abcdefghij0123456789ABCDEFGHIJ0123456789abcdefghij0123456789ABCDEFGHIJ0123456789abcdefghij0123456789ABCDEFGHIJ0123456789abcdefghij0123456789ABCDEFGHIJ0123456789abcdefghij0123456789,serial=123456789012345678901234567890 

'serial' is exposed through VPD page 0x80 and is limited to 36 chars.

'device_id' is exposed through VPD page 0x83 and is limited to 256-8
bytes.

udev seems to use page 0x80 (not 0x83) to generate symlinks.

Anyway 20 chars is < 36 chars so the need for longer serials for
virtio-blk remains.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top

