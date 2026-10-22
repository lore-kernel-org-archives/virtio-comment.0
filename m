Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675165;
	b=iNe+3qiGkqAJ+PLebUI5V5Ah2Qou3+QM4aPYKx4vWHR23xcUabvyFgIoCiUj1yvHft67
	 FxJSTtYzN9sEu39zK3pYwwpAvvDD41EEpdkZ8unpFF6Id6/6C8wtOa+famyOrnhYuGThw
	 MxRQMb58zah/Bi7JBl4G/1Eik7NNI4uvY0vuqIRJtFOusn0+M9PhRkufBMPuPiRgFGBDn
	 R3/2cDPAWoJvt7s1OR+j2gb2IwkLN+jFo+gWD9eE3WOMQEoEroieuF39KILzJT/5i7ZdX
	 nHui+jivO88FqcWwqCiBOQWeK8KLyGAqm/QWUzoqIaTP6xC1gJ4ug5a24VDbvCWGyOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675165;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=4Gt4/sWpN7N/IwdPS/zuv8cbOUb8JLvPszeLKB6T1nI=;
	b=Wx7Wc5T/GPPQJH0XDvdExadHe1blLAXEydacZm25fOI21ekrSl2Nf+lgwWscWMcj6hAP
	 F9kOqUrBMePpdFPzp5iX0wzGxdX4Sfk8EmmG+HzRcMcjPxHXRZH/cG6Rg1u6HEvw3irC8
	 n8l8HrmBzpeaP7vYOJ/fRWrI5XO/vVryGOb7edZ6SQ3Bok7ggCnwvdAGQhtnOL0gFAHb9
	 UMV0HZDjir8qg5ZVnFo08CXjxXlyK8Yk1yDUVjSqk1e/7t1aSqzYurWcEDQd6dkaZOPIX
	 6r2zZn8ukkzWD6BSG09pyh6vSvn7/aUeWeSK7+nJ5QM2X4e7N/YV/qNK6oXRMAGR7xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P+JHwFvz;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329A6606A319
	for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 13:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 329A6606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P+JHwFvz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792675164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Gt4/sWpN7N/IwdPS/zuv8cbOUb8JLvPszeLKB6T1nI=;
	b=P+JHwFvzBDqtLFuA6UIoII76qMxw5OZ5SHlbkiyAs/5kzYjXp2rp1dfU1rOOgygxjt1H3l
	99173KfASZL57uQUPyMUnhOD99FyaUIIPwOWGlAyqY2Nkn8roVfiJ3NHdqCWZxIf8I5as5
	//VzslYjm20/ezU88MmAthzaQSb3Yk4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-676-XuyKgO1CMLapF_w_eF0gQg-1; Thu, 22 Oct 2026 13:19:23 +0000
X-MC-Unique: XuyKgO1CMLapF_w_eF0gQg-1
X-Mimecast-MFC-AGG-ID: XuyKgO1CMLapF_w_eF0gQg_1792675162
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a2063be141so6728415e9.1
        for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 06:19:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675162; x=1793279962;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4Gt4/sWpN7N/IwdPS/zuv8cbOUb8JLvPszeLKB6T1nI=;
        b=mdfHFYz+CejVlaazdefXD/3D+w6IcDwYaOemDa2/toCtkyYuMuI+DTLkge+uMojiYP
         GnE+jilUgBs6/NmAn3GIqXqTNz3D1eJvv/hNVZ76G5VyYwSEPLu4EAxsqKerOpaoq31/
         lqh2pa7VyMKjBLcHxsinkhHeiSHz/li5hUst/nUaXIPUoZUVWnA/sA/PL6bX6T+xbUXd
         bZtj2hVK/GAaUoI7QzcAtvvJWAim8W/j11ha4yP6oL3NPKSw2n0uP8O8Rf0Th0yb6kNx
         F9C6CbBt3IwObxWxqn3koysr/ZZH/w8MAKllWrBfXy+smlmLGVN3r5pf8guBMvU1mvKF
         IAUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfFG9mBpqjvBCxfb8cwiOOJswpf4D60sFwuptWuD933t7yNtaCxCC6h/sq7e0GRu8O8wIfbfOYVAvAUeSvdQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLupA1sb/2N1FbH5W+M5B5s3yXlrwG05oKdazZs/gaGuFUX/TTa
	n34p7G3BZlgFOLXNPqdoDkksU+skKlKUL+iM9b1i6o+G2FmX+4/FrwBBCp25yHQ6nNlC7gPaLdS
	R999G1GNvczOjEoKehMR6xCwCqqPm1bUpbPl5oeirSyz6dFXHMz49/ycJryf6LFoE9HFE
X-Gm-Gg: AYBFou0pQV1/5l5/ew21e+lPMjmAX83BPcspFS9/DIMrU58LThyMqrcMF3g1CSAT8JF
	LAairfHynPAFXOnze3qDiUhSmXoYWNPAz5YGWV41aCwg3iRB3BuBhhO8BhmMSDDXzaBUzXr4r7P
	dlz++wRjAg4Mqolr27+1ibvhOXSmO6FbTeXJPIt3JansRU0/SlwFGoWKbju2gmK7X/rgRC1khKy
	RVkn8RWDrvsl8TYukbiK/ZyENhdZQHUSpZv1gTASAf+r7tSNkD8+ZaVq0HAxxQGE52fLy8LvQyl
	LmV8dssXl9ZsLfXYzYVhWBTXmsycHtiNaWZLAL2hXoqAQCZggmm84BBZIzHEMVCQw7Y=
X-Received: by 2002:a05:600c:524f:b0:4a1:ad27:e797 with SMTP id 5b1f17b1804b1-4a1fdaf71f5mr102364785e9.6.1792675161474;
        Thu, 22 Oct 2026 06:19:21 -0700 (PDT)
X-Received: by 2002:a05:600c:524f:b0:4a1:ad27:e797 with SMTP id 5b1f17b1804b1-4a1fdaf71f5mr102363935e9.6.1792675160802;
        Thu, 22 Oct 2026 06:19:20 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835404sm13852890f8f.42.2026.10.22.06.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:19:19 -0700 (PDT)
Date: Thu, 22 Oct 2026 09:19:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Peter Hilber <peter.hilber@oss.qualcomm.com>,
	virtio-comment@lists.linux.dev, Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
Message-ID: <20261022091645-mutt-send-email-mst@kernel.org>
References: <20261021180031.7175-1-peter.hilber@oss.qualcomm.com>
 <d4a11a65-ebed-41c9-8482-cf0ec94dce79@gmail.com>
 <20261021154801-mutt-send-email-mst@kernel.org>
 <87mrs62vzj.fsf@redhat.com>
 <26e6efbe-abc0-452d-a682-611cf91e41b8@gmail.com>
 <20261022032118-mutt-send-email-mst@kernel.org>
 <CAAjaMXZgKGWL0dJJSh74Pf20EezY8zPOsSg1aNkp_ssvXuP7BQ@mail.gmail.com>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CAAjaMXZgKGWL0dJJSh74Pf20EezY8zPOsSg1aNkp_ssvXuP7BQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aF0Su_zPHPXvUO5ScIW4niiqTKdm1DuHOIPyKchZU_Y_1792675162
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Oct 22, 2026 at 11:41:17AM +0300, Manos Pitsidianakis wrote:
> On Thu, Oct 22, 2026 at 10:24 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Oct 22, 2026 at 03:07:41AM -0400, Demi Marie Obenour wrote:
> > > On 10/22/26 00:35, Cornelia Huck wrote:
> > > > On Wed, Oct 21 2026, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > >
> > > >> On Wed, Oct 21, 2026 at 03:25:31PM -0400, Demi Marie Obenour wrote:
> > > >>> On 10/21/26 14:00, Peter Hilber wrote:
> > > >>>> Reserve a device ID for QPSFI devices (Qualcomm Platform Subsystem
> > > >>>> Firmware Interface). QPSFI devices expose functionality across SoC
> > > >>>> subsystems through a common Virtio-based protocol. There are no plans to
> > > >>>> standardize the devices.
> > > >>>>
> > > >>>> The Linux DCP display driver series is planned as the first user of this
> > > >>>> device ID:
> > > >>>>
> > > >>>> https://lore.kernel.org/all/20261015-jshekhar-drm-msm-dcp-v1-v1-10-48aad0fe4f72@oss.qualcomm.com/
> > > >>>>
> > > >>>> Device ID 51 is already reserved for the Virtio HAB device:
> > > >>>>
> > > >>>> https://lore.kernel.org/virtio-comment/20260702140939.3535968-1-zeloren@qti.qualcomm.com/
> > > >>>>
> > > >>>> Signed-off-by: Peter Hilber <peter.hilber@oss.qualcomm.com>
> > > >>>> ---
> > > >>>>
> > > >>>>     v2:
> > > >>>>
> > > >>>>     - Rename the device from "Snapdragon device" to "QPSFI device".
> > > >>>>
> > > >>>>     - Refer to DCP Linux driver patch as planned first QPSFI user.
> > > >>>>
> > > >>>>     v1:
> > > >>>>
> > > >>>>     - Was posted as "content: Reserve ID 52 for Snapdragon device":
> > > >>>>
> > > >>>>       https://lore.kernel.org/virtio-comment/20260826115504.1955-1-peter.hilber@oss.qualcomm.com/
> > > >>>>
> > > >>>>  content.tex | 2 ++
> > > >>>>  1 file changed, 2 insertions(+)
> > > >>>>
> > > >>>> diff --git a/content.tex b/content.tex
> > > >>>> index 243ce2dde36b..7416939e67d3 100644
> > > >>>> --- a/content.tex
> > > >>>> +++ b/content.tex
> > > >>>> @@ -805,6 +805,8 @@ \chapter{Device Types}\label{sec:Device Types}
> > > >>>>  \hline
> > > >>>>  50         &   Video encoder/decoder device \\
> > > >>>>  \hline
> > > >>>> +52         &   QPSFI device \\
> > > >>>> +\hline
> > > >>>>  \end{longtable}
> > > >>>>
> > > >>>>  Some of the devices above are unspecified by this document,
> > > >>>
> > > >>> I think it would be best to have a single ID for vendor-specific devices.
> > > >>> I believe most of the ID space has already been used, at least for virtio-PCI.
> > > >>> --
> > > >>> Sincerely,
> > > >>> Demi Marie Obenour (she/her/hers)
> > > >>
> > > >> Sounds like a good idea to me. And then qualcomm can do what they
> > > >> want, like check subsystem id for pci or whatever?
> > > >> Only issue is there is no way to distinguish for mmio/ccw.
> > > >> Maybe, add vendor specific id as first e.g. 8 bytes ro in the config space?
> > > >> Peter?
> > > >
> > > > Using some information in the config space looks like the most flexible
> > > > way to me. Are we still happy with how the device ids are organized in
> > > > general (i.e. when do we want a new one, and when do we want to extend
> > > > an existing device?)
> > >
> > > For a platform device like this, I'd prefer to pass the information out
> > > of band.  After all, this device will only ever be found on Qualcomm
> > > SoCs, and presumably the kernel knows exactly which PCI device is
> > > supposed to be the QPSFI device.  This means that the kernel can just
> > > special-case it.
> >
> > Yes but we are discussing making this id a general "vendor specific
> > device", as opposed to a "qualcomm device".
> 
> Is there a reason why a generic VIRTIO_ID_VENDOR wouldn't work?
> 
> Instead of adding more and more IDs for different devices that will
> never been upstreamed.
> 
> Then, a kernel can discover all vendor devices when enumerating the
> transport, ignore them unless it knows specifically about them through
> ACPI or device tree.
> 
> It doesn't make sense to me that HAB/QPSFI need an ID when they are
> unusable to anyone except for qualcomm kernel drivers so maybe we
> should require that an ID allocation always needs an explicit
> justification (i.e. "the spec will be upstreamed", or "we cannot use
> VIRTIO_ID_VENDOR because X/Y/Z").

Right so let's just reserve ID 52 as VIRTIO_ID_VENDOR for now.
And document precisely what you are saying.

And let's add a chapter for it please:

"A driver is not automatically loaded based on VIRTIO_ID_VENDOR alone,
 instead, the platform probes the device, verifies it is the
 correct vendor specific driver and loads it, all in
 a platform specific way".

and conformance clauses stating the same.

-- 
MST

