Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1158A7EF09
	for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 10:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720781379; cv=none; b=o6Qx0nB7TgcbH7Y07oN+njakPIN/3l6Gd1hC3xdYZ2WK8XR+iiO/aqg+qHPVv+i6zTa6UJ5TDCVVdBlndS+Ct6AZbTu7v+CazbBdZRGHlTxTo5rbddH9vQMU09O2O+wvcuT1GMtWQfRDNJUcxYdziqa134ls0hc9ZBlalmc0svA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720781379; c=relaxed/simple;
	bh=jrR6etc+Xb6cyl6k7kbe+Nq7BjYYYzXDmntAzkGcPFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=kZYQl4bqViexYgwUcJLmbcMOgFQMREe0Lnao9DRtHu1axjmKZzGz8JFV8oEbeDMan9qFoxKwcIeaIH9btazvmIIWx7ogc/xnjwK6Dab2ng4Dc60gvZpqePKLlc85gXBSBT+tgBjLyZu+22BbQ/iBXzG0BTQqtZ70OwqHeHNCSy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WyNipyA2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WyNipyA2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720781376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PM1G5FpZh9X+q+dR5SHVwo4mNfDr4w9o/IJgZ7uggdw=;
	b=WyNipyA2N4ue+bOvoeabXh8LtvJVL9xMmuki0SauNHWouVn7MFFPJTBNHSJxkUHmQygbea
	5W/eYHtkTKdl7dd1ZbB9xJTRAowaEnk6B6pj8txDzfEtVAXqDvM7GUa8A5HP72mYonHvq9
	dGauinRQkdvEwHAiT0eXYTVLW0rquMc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-qX2-kiEWPSeeDUlGhKsmeQ-1; Fri, 12 Jul 2024 06:49:35 -0400
X-MC-Unique: qX2-kiEWPSeeDUlGhKsmeQ-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3679ed08797so1161359f8f.0
        for <virtio-comment@lists.linux.dev>; Fri, 12 Jul 2024 03:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720781374; x=1721386174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PM1G5FpZh9X+q+dR5SHVwo4mNfDr4w9o/IJgZ7uggdw=;
        b=LB1DNfZqePVECFTIfCnS/qEVmxjIzvxhCOMNKt1tPnWKS28XWdOen1aROQMQbuhMIg
         plM2hX76oeBHYnEBjcGl8hL0tYBtIsVfneZKDvi3f83z1NbOXKECzE7k4PjhB/AFN8UU
         0Cq+MT5DCBCHMJ6x8MF2lXIj4MlNq8NjYHLBDc/I2vMZkYnDrtIMYKS+jSTQIbCAGsUI
         c1pyLYFRrQTbKMJX9ElseSZ07LAVYUcB10b/PQ/I2ql5QNijDR7cT0k6e9fxxF4Rn8ob
         +oLOhLQ+MCTj8YiCL5Zg90YncOWh4AQpFQhmJC0RrfIjEiPhKF6/0pD9A+bcQLfxFL6K
         DeEg==
X-Gm-Message-State: AOJu0YxXUZh1UkEtP0MriOwDWfP5LZHIVMVAY14mo9dWWXpVHD683433
	GXgakK3NRjquDkTubiI2Wmy8vhH3M7pB46VoZY/CHVICdVYDFk6bLdIYc3OreA1z/Q4gMP9ZlgV
	tX6auLOSnvcGf7pP4brpQvvOa8oewlpnPfpWypZYVXUCSB6PR3bBaywA+APi6V8t8
X-Received: by 2002:a5d:5258:0:b0:367:9abd:6940 with SMTP id ffacd0b85a97d-367cea455e5mr7262938f8f.8.1720781374035;
        Fri, 12 Jul 2024 03:49:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPaQHmxpQBL99xoftr0QRHwh3uW6Me31RekjvEBjM8ru/ejIRhdS61b7fdH0HX92TKhWjlaQ==
X-Received: by 2002:a5d:5258:0:b0:367:9abd:6940 with SMTP id ffacd0b85a97d-367cea455e5mr7262923f8f.8.1720781373480;
        Fri, 12 Jul 2024 03:49:33 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:341:761e:f82:fc9a:623b:3fd1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde7e17csm10039691f8f.7.2024.07.12.03.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 03:49:32 -0700 (PDT)
Date: Fri, 12 Jul 2024 06:49:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev, harald.mommer@opensynergy.com
Subject: Re: [PATCH] can: drop a broken conformance link
Message-ID: <20240712064806-mutt-send-email-mst@kernel.org>
References: <87a6c3c4463e9f304cdd5dd5fac2194a95a8bcd2.1720724591.git.mst@redhat.com>
 <ZpEJcaI2D1ETfqkF@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZpEJcaI2D1ETfqkF@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 12, 2024 at 12:46:09PM +0200, Matias Ezequiel Vara Larsen wrote:
> On Thu, Jul 11, 2024 at 03:03:17PM -0400, Michael S. Tsirkin wrote:
> > CAN device has a single device conformance section, drop
> > a link to a non-existent section, fixing a Latex error.
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  device-types/can/device-conformance.tex | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/device-types/can/device-conformance.tex b/device-types/can/device-conformance.tex
> > index f944ffd..3725164 100644
> > --- a/device-types/can/device-conformance.tex
> > +++ b/device-types/can/device-conformance.tex
> > @@ -3,6 +3,5 @@
> >  A CAN device MUST conform to the following normative statements:
> >  
> >  \begin{itemize}
> > -\item \ref{devicenormative:Device Types / CAN Device / Feature bits}
> >  \item \ref{devicenormative:Device Types / CAN Device / Device Operation / CAN Message Transmission}
> >  \end{itemize}
> > -- 
> > MST
> > 
> > 
> 
> I wonder if authors just forgot the`\devicenormative{}` in 5.20.3
> section: `Device Requirements: Feature bits`. I added Harald in CC.
> 
> Matias

that section needs to be split up - it seems to list requirements
without saying who the requirement is for.
in fact device requirements here generally need work e.g. they specify
a structure of a request driver submits - that should be a driver
requirement or better moved to a non-conformance section.

