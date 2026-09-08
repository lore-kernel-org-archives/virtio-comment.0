Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB8650EC11
	for <virtio-comment@lists.linux.dev>; Tue,  8 Sep 2026 10:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861984; cv=none; b=hYuM0d2R6tIBSnz2WVrgwkmbhA3ev6K/Pwg4CqJGMKYzRYW7Pf8fpeJ3sbU+eRfjWBBeIXuQ9V7O08yLiZzSu6pLC9tZhRvyd7HvxPe1ipMwF9xVkFm0A0677JqerxW2uIyedlX1dAdvC9ulCYWceZjLqA60SGUXPr1ehif+PFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861984; c=relaxed/simple;
	bh=xst/TngD7GiWmaKyVKGuOptHPyjYY3MyINkFgO9yKzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=rpxSrepTaJ03XWIO4Ig1j0W4tc93GPi4mIiZh9gGC5gZAWR0hCDEGZZjwY1riCZzDuQtsgvcxE/yMb2zsG/kSGh1XdJKVFNOM004CUrZfC1kWl7cYXdKg8dOMF3Fj5kXz1THi+P0iA76CHvqkSaCNQdwaJflNA/6Ij8YcNk16KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G+USN7Ly; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G+USN7Ly"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788861981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c0q7+IVGyfBaRYp548/BC618mPtNb+9qS78FS1UPm+I=;
	b=G+USN7Lycin4uLuGaxUxlBfZPgT0wz/NcI29+gZg8pPKAk1X4JuVJUOn0d7W5t8XsQb7Ea
	ZaZz8Sf+ytTc7U8lQW6kg5x5VhR3gb/tOBEotlSq9P8w/D/O6gATo9KrbsdBquZWCemb46
	Lta1c9XDO74qo8mI73pS5LLowtwsV8g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-_ti3hYcKNAuZOXKiblxOkg-1; Tue, 08 Sep 2026 06:06:19 -0400
X-MC-Unique: _ti3hYcKNAuZOXKiblxOkg-1
X-Mimecast-MFC-AGG-ID: _ti3hYcKNAuZOXKiblxOkg_1788861978
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49cdc4080ddso25745055e9.1
        for <virtio-comment@lists.linux.dev>; Tue, 08 Sep 2026 03:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788861978; x=1789466778;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c0q7+IVGyfBaRYp548/BC618mPtNb+9qS78FS1UPm+I=;
        b=XG5VkliCYx24Ivr2C65EQbW+OZGkrep+gJN1cVGUY/ThYXUPw48epAN9Hn3FbrWvGt
         gb9gXljGiJDG8C6aqUBuygvuw+8YcW0CZoA0BT1O4aGU560oFbrAtgKuvWx77e7MMvOW
         MbyeBvAvFURR2tND2o71+93MDruoVGXHQK3BMC5sKsVWQXOriQBrUG78v840MLhOS/ms
         rP7Y2UGQo7JVSuBA7QMk+/XOmsDAB2xP9e4Xs2iSyhA+5OkcNvJzxnAwoKrultsb6ATN
         xOlKdlErNpw3KJCnjGmBzi7Q2DTCUlIWEKS7gQFmFyxN5obgS3uDpBelj8ps7IovklSc
         nTBQ==
X-Gm-Message-State: AFuF++n9hseIEseEs7L008uN2lNIuNus9+MVdbaqlK8i2MX+UuApWE4i
	d8xrvPfdkuuPcD9sRPi2sUKUQXnhuZr/eiNSQuwmk7oYUhAsG5di69w5VQEfgdVGyt1HSFB4B60
	P8HjzPJ+PSlEACf/OymLP4+HvHekCA3qLeKNNt4DLAnTGko2i1hz8kg4/iQrtKi+3+bH0
X-Gm-Gg: AYBFou0fRsvHfHCmrSESTWxxLkF7J78hpQq14h82xpG6UEgXHcqJEVRppT5YXwcp/B4
	G08TzinV4WkJ8cYi5owYtUiAjtMIkXqFmNnqhpCB3x8Lq8aqO03Zv0b0hiW+yryG4ni/hWtGzpu
	/QozbbZP0bg+14lDPrIkm5Fo5SD7OPZDNlen03iWgWJqcv33k7EwoWXzUSjvJHhBdYGodwLlcS+
	PLrKGSOxp01wL1I90H5wLgdY5KIgSNiEYYXf9J54QErOAqdGP7XGwmnAlbqV0yKOhZod9aO+aiP
	TjJZReRW8vGH1bw6kRjBUslBsv9OwA4Vbt+kxNztPzBDFb0UScNs2krWPIQB0JR/7EAuk+a1Vi1
	fe1z4gu8v2K10xb7vkJ5TMqA=
X-Received: by 2002:a05:600c:3b12:b0:49c:f13e:e50 with SMTP id 5b1f17b1804b1-49d1757e82emr63846835e9.13.1788861978003;
        Tue, 08 Sep 2026 03:06:18 -0700 (PDT)
X-Received: by 2002:a05:600c:3b12:b0:49c:f13e:e50 with SMTP id 5b1f17b1804b1-49d1757e82emr63846155e9.13.1788861977421;
        Tue, 08 Sep 2026 03:06:17 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbe5b252sm334012295e9.3.2026.09.08.03.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 03:06:16 -0700 (PDT)
Date: Tue, 8 Sep 2026 06:06:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH 1/1] device-types/blk/description.tex: Allow longer
 device IDs to be returned
Message-ID: <20260908053922-mutt-send-email-mst@kernel.org>
References: <20260906145444.127570-1-rjones@redhat.com>
 <20260906145444.127570-2-rjones@redhat.com>
 <20260907033334-mutt-send-email-mst@kernel.org>
 <20260907140224.GQ1436@redhat.com>
 <20260907123437-mutt-send-email-mst@kernel.org>
 <20260908093534.GT1436@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260908093534.GT1436@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YrGralQf5kIjwg-_UQYJt2ob6aIiLLcwjRuJY8amJOg_1788861978
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 08, 2026 at 10:35:34AM +0100, Richard W.M. Jones wrote:
> On Mon, Sep 07, 2026 at 03:27:25PM -0400, Michael S. Tsirkin wrote:
> > On Mon, Sep 07, 2026 at 03:02:24PM +0100, Richard W.M. Jones wrote:
> > > On Mon, Sep 07, 2026 at 03:56:56AM -0400, Michael S. Tsirkin wrote:
> > > > why 247? It feels like a lot, especially given we are padding. I'd say
> > > > 128 maybe.  This way it fits in a single pci express packet on most
> > > > systems.
> > > 
> > > virtio-scsi supports, at least in theory, 248 bytes, see:
> > > 
> > > https://gitlab.com/qemu/qemu/-/blob/cacd3462963a0a4f5bab4263ce79c2aa4b32692d/hw/scsi/scsi-disk.c#L708
> > > 
> > > This is chosen because of the maximum page size of a SCSI VPD (256)
> > > minus the 8 bytes used for the header in VPD page 0x83.
> > 
> > Can I see a spec which says that is the maximum size?
> 
> I don't think virtio-scsi is following a spec,


But you referred to SCSI VPD and said it has a limit of 256
and an 8 byte header. I can't figure out where this is from?

> but it's clear from the
> source code that the limit is 256-8, see the link above.
> 
> [...]


Hmm. I see MAX_SERIAL_LEN which is 36? And  MAX_SERIAL_LEN_FOR_DEVID
which is 20?


> > > > > +VIRTIO_BLK_T_GET_ID fetches the first 20 bytes of the device ID
> > > > > +string.  If the ID is shorter than 20 bytes, then the response is
> > > > > +padded with NUL bytes so its length is 20 bytes.  (Note that if the ID
> > > > > +is 20 bytes or longer, this means the response will not be NUL
> > > > > +terminated.)
> > > > 
> > > > Why first specifically?
> > > 
> > > For backwards compatibility (assuming I understand the question).
> > > qemu's current behaviour is to truncate.
> > 
> > That's just a qemu command line quirk then.
> > At least from spec POV it isn't - the id must be <= 20.
> 
> Isn't the virtio spec also there (partly) to clarify and formalise
> what existing implementations actually do?  qemu truncates.
> Firecracker truncates:
> 
> https://github.com/firecracker-microvm/firecracker/blob/7699746649826d1dfcdde626b3131bac08f28e0d/src/vmm/src/devices/virtio/block/virtio/device.rs#L159
> 
> libkrun seems to be using the same code as Firecracker, so it also
> truncates:
> 
> https://github.com/libkrun/libkrun/blob/413a011760b7ee61493fb0073f7810319ca6a181/src/devices/src/virtio/block/device.rs#L170


I can easily imagine a situation where someone prefixes the serial
with "virtio-" or whatever extra data, and shows the suffix
as the short id. Or hashes the short id. Or whatever.


> I have a v3 which considerably simplifies the specification &
> implementation which I'll post very soon.
> 
> Rich.
> 
> -- 
> Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
> Read my programming and virtualization blog: http://rwmj.wordpress.com
> virt-p2v converts physical machines to virtual machines.  Boot with a
> live CD or over the network (PXE) and turn machines into KVM guests.
> http://libguestfs.org/virt-v2v

