Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DBA25A63B
	for <virtio-comment@lists.linux.dev>; Sun, 26 Jan 2025 16:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737910254; cv=none; b=TFr32wf/ZypeBa1AX2qhoBeFJTWaQ6YFiQedVlqXtnlYqEP7AWw2owYg7VRspduT6u72HnVlwU9HFXPU0Xyq4i2smmNHxOSfwoQnmpgHw4vXGfSBLeyAZs34qCFdUipqDBX2LD2HaDPknfbnVmIJoF0XtVLlToiWvvFfA0s3ka4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737910254; c=relaxed/simple;
	bh=EqBLkyPAuLXQqs5zRVcTabmJnBnYc5vgdN15LkritNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=h6T6dNDF8c5FuK+iYUeiTzNZ6GSyyUS+AJlk8K62x6kHviVa6dSoJpiUhX1qBNzl5wlXi4sOFnUGvbdRaciXqRjcH+qGWz9S4A8+bKFqgHw37WTEQot9IGKRI5myea7ZxTXk4HgRfqYLV4uTVL/7UL9pPlFPYrrwh518viy+ifU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F2Wanp08; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F2Wanp08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737910250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i8OJhBdHDiPAJ7XuK2qSdqKwiNUzTvw5iE9s4dBPG4Y=;
	b=F2Wanp08/v4z/4yd9Iz9PIyaWp07Y62aOMQ/u874LJ7IdkFgKGEx4mkJeTVBGMnp+O7R/A
	N9og5rh6qINrOORI7wv/w0vlJaZojigSThgdUNelkNk0SH9gcrbTaC9Ga2X6ZAKdwcA6/d
	k+e+DW0vBQ/PkzuzYoI9RXOmOZaAV9o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-4rFngxE8PbmO8IV7Cstc5A-1; Sun, 26 Jan 2025 11:50:48 -0500
X-MC-Unique: 4rFngxE8PbmO8IV7Cstc5A-1
X-Mimecast-MFC-AGG-ID: 4rFngxE8PbmO8IV7Cstc5A
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-385ded5e92aso1439466f8f.3
        for <virtio-comment@lists.linux.dev>; Sun, 26 Jan 2025 08:50:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737910247; x=1738515047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8OJhBdHDiPAJ7XuK2qSdqKwiNUzTvw5iE9s4dBPG4Y=;
        b=coX8jw0X11VGsM9vW+JBE4+Gjn3bjrmgcmW+zOLxbLRYcRz2FbrwCgZ6qfAc1FGh5Q
         e544GAyjRZ3LdXdqOkImyaXWaXckZvdKJXXqG2mzgofwtMieX8EUPqp8kNaro9WIXYWt
         ukN75sTn2AYyxj9fbLEU2JrXp2+mWijs1HRSl5hKX2JvYiNbjrhJ+RNxwjXbudGe4eHW
         lFeGhnF13SC8eZJsR06A5+8RJuooDXCitwZMGU8+0swW56k0bWzce+X8yj+ght2opYCi
         q+c1XK+skSMKWW8Ib9XRb9XumPBMlkBSYT91AnMksJCEFtOSFFcfQgV2M9nhgSuxBDak
         cTjA==
X-Gm-Message-State: AOJu0Yy3Baf1lntxeubeiVSGu0kgjJ6lNW/XOmDxgaZy6XoDEoSF8jBl
	O/VLymhdHjO0dccpNIo3UXfU8XSq4Lgkf+0Hz0Mfd2URzR6dhkYbHw57u4XitvTPWtkHjNGLXCO
	/m4vRIZ6KEvrscsuAJwfpUgNYxVeaDCc3WPSgGBoTaGcVIpODUVfvcGvUetrXmkOX
X-Gm-Gg: ASbGncvH7lZ5GrbWfNUbz3ereo2XN/6cva2t/WPdmkeinak5d776M6/Sx7x0nghCj9J
	QRXV0+J0ayt4UCkmjv/qND3MFaR0BuldBwXTVDSiN2TkKHwyEdolNR+7vGM+n4yTaLkdd0n0uR+
	lfWMmFSKc0xfwxpRGkiXVxVbXX41SyIm06yiMt9n178Q+ROQ6dgp1cN8dzS2Pp5TXO0Wts6CxvA
	xX7CP9ZvnbRfJN/7BBhNj591KoE8YZwTvnG9dvGUeNUGR94ReYlwr/X3qY4/cUVCQdd1c1GmA==
X-Received: by 2002:a5d:64c2:0:b0:38b:da6a:8a02 with SMTP id ffacd0b85a97d-38bf59effcdmr35001741f8f.47.1737910247362;
        Sun, 26 Jan 2025 08:50:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7kA+l8Si4TUhl7H72ZMWIetqh8/a9JrOy0KbdswBtpdJsm7zEz0XlUv3hHlqakGn2QI/EDg==
X-Received: by 2002:a5d:64c2:0:b0:38b:da6a:8a02 with SMTP id ffacd0b85a97d-38bf59effcdmr35001727f8f.47.1737910247008;
        Sun, 26 Jan 2025 08:50:47 -0800 (PST)
Received: from redhat.com ([2a02:14f:178:cafd:530f:d530:b45b:5ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c3bacsm8394455f8f.83.2025.01.26.08.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 08:50:46 -0800 (PST)
Date: Sun, 26 Jan 2025 11:50:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Subject: Re: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
Message-ID: <20250126114917-mutt-send-email-mst@kernel.org>
References: <20250126062058.13695-1-parav@nvidia.com>
 <20250126041732-mutt-send-email-mst@kernel.org>
 <CY8PR12MB71954013A3A3E5F81E03CD9CDCED2@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CY8PR12MB71954013A3A3E5F81E03CD9CDCED2@CY8PR12MB7195.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _i5rPX_qSj9zv5lAXlYRO5cl-SzMXpMEHxHdMD00vI8_1737910247
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 26, 2025 at 04:44:51PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Sunday, January 26, 2025 2:50 PM
> > 
> > On Sun, Jan 26, 2025 at 08:20:58AM +0200, Parav Pandit wrote:
> > > Listed patches in the fixes tag, incorrectly used the reserved feature bits.
> > > Fix them to use the well defined device specific range.
> > >
> > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/212
> > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/213
> > > Fixes: 8cd457d8aa82 ("virtio-net: define UDP tunnel segmentation
> > > offload feature")
> > > Fixes: 3fea589bd7c6 ("virtio-net: define UDP tunnel checksum offload
> > > feature")
> > 
> > 
> > Well the hashes will be wrong I think.
> I pulled the patches from the mailing list to local repo using b4.
> Once the new fix is voted, I will merge both the series together so that hashes stays the same.

ok. just make sure to verify them before you push.

> > So, we can do the ballot for this fixup, and wait with applying the patches
> > until that new ballot completes.
> Yes. The small fix is reviewed by Paolo and Cornelia, so if it looks ok, we can wait for this week for any additional review comments.
> And merge by Feb-10 or so after new ballot completes.


Acked-by: Michael S. Tsirkin <mst@redhat.com>

> > Or we can do a completely new ballot.
> > 
> > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> > >
> > > ---
> > > changelog:
> > > v0->v1:
> > > - added Cornelia's reviewed-by
> > > - added github issue number
> > > - skipped Paolo's suggestion to modify 'le64 offloads' as its only 64-bits
> > >   and new feature bits are in > 64 bits range
> > > ---
> > >  device-types/net/description.tex | 24 ++++++++++++------------
> > >  1 file changed, 12 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/device-types/net/description.tex
> > > b/device-types/net/description.tex
> > > index efb543f..b546cd7 100644
> > > --- a/device-types/net/description.tex
> > > +++ b/device-types/net/description.tex
> > > @@ -88,18 +88,6 @@ \subsection{Feature bits}\label{sec:Device Types /
> > > Network Device / Feature bits  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)]
> > Set MAC address through control
> > >      channel.
> > >
> > > -\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (46)] Driver can receive
> > GSO
> > > packets
> > > -  carried by a UDP tunnel.
> > > -
> > > -\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM (47)] Driver
> > handles
> > > packets
> > > -  carried by a UDP tunnel with partial csum for the outer header.
> > > -
> > > -\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (48)] Device can receive
> > GSO
> > > packets
> > > -  carried by a UDP tunnel.
> > > -
> > > -\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (49)] Device
> > handles
> > > packets
> > > -  carried by a UDP tunnel with partial csum for the outer header.
> > > -
> > >  \item[VIRTIO_NET_F_DEVICE_STATS(50)] Device can provide device-level
> > statistics
> > >      to the driver through the control virtqueue.
> > >
> > > @@ -136,6 +124,18 @@ \subsection{Feature bits}\label{sec:Device Types
> > > / Network Device / Feature bits  \item[VIRTIO_NET_F_SPEED_DUPLEX(63)]
> > Device reports speed and duplex.
> > >
> > >  \item[VIRTIO_NET_F_RSS_CONTEXT(64)] Device supports multiple RSS
> > contexts.
> > > +
> > > +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (65)] Driver can receive
> > GSO
> > > +packets
> > > +  carried by a UDP tunnel.
> > > +
> > > +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM (66)] Driver
> > handles
> > > +packets
> > > +  carried by a UDP tunnel with partial csum for the outer header.
> > > +
> > > +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (67)] Device can receive
> > GSO
> > > +packets
> > > +  carried by a UDP tunnel.
> > > +
> > > +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device
> > handles
> > > +packets
> > > +  carried by a UDP tunnel with partial csum for the outer header.
> > >  \end{description}
> > >
> > >  \subsubsection{Feature bit requirements}\label{sec:Device Types /
> > > Network Device / Feature bits / Feature bit requirements}
> > > --
> > > 2.34.1

