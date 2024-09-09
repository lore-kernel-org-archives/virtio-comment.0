Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4148B1BA26B
	for <virtio-comment@lists.linux.dev>; Mon,  9 Sep 2024 14:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725890465; cv=none; b=PoPDd4n0gCvtBbQKdhx7yDlZ41dXNbqLIOoYcrE7PXfxvpVs+GvQyUA6gtywyABha8crp9maJ9uLY6z7UTpV20Lu8LMjATdjkEqKmzuYFYkCn0RIS5h+72/w4oGURFCH7cGZrs1xBS3uF3YSRaN0bvsNSwOvmiszDbXzoNA4BvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725890465; c=relaxed/simple;
	bh=eHiwOs/nGNPEXIKY3f4YQLhCZ+aDJbe1FPWIHk5c1Ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=PGGJdLoVVsqak/HMPmiIlq+rj0BNBnxkRlDG0u6inns9DDMJmLXIgOVMHsClZb9mVtWgmFcZdYCu/qNa1bBZn2iX3vd25Cf9n4e2XuaX1xVgSUjU34kJZvNKgmHFkCrvKG+fZk47qgS7mkTDSRl2zdsxiPMQ+++OlH+PeuRHQrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SrGQgktn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SrGQgktn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725890463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y5pl9ZlrYRvSDl5QYM5GF9BBB0jw8oS+mfQhtBTZRzo=;
	b=SrGQgktnEqX49TvhfBX0m91w+0AEO6zlJPoRcoKN4+USiorss7UbuLbY5Bw70JpaZe9xtb
	gNlZrW866Ed/G/hLCN6BQWzH04NREs/6Xqo17a73DG+r2pu4x06zybSKwcwRHh9iL8SkJC
	WjDacSPSeA9eNH6DCQFcfcMNCucD/rs=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-jQynoXgqNo2NHYGWZXBlhw-1; Mon, 09 Sep 2024 10:01:01 -0400
X-MC-Unique: jQynoXgqNo2NHYGWZXBlhw-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-45835fe0435so11401531cf.0
        for <virtio-comment@lists.linux.dev>; Mon, 09 Sep 2024 07:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725890461; x=1726495261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5pl9ZlrYRvSDl5QYM5GF9BBB0jw8oS+mfQhtBTZRzo=;
        b=Rn5CHdIJjqHJ0M0Hxg5XEqQ3DzYxeZfAnXANYxnF49oLJdC/RJFTT+59TDVbP/gTXd
         oxtDfDrNxyGYHG1/8IrL54E+7caR2QxYXNXgVS02v0xhDc0f+67rrHNEviTs4UjBzO3F
         41iTRitS1CjBMHdKsZmZkpbK4cxwhdXoIF16HOStDGtwmDO9E81ie8nal2oPj0hnhdL5
         QsZkHcGRW13NA0YAJYnpUNbPFVHpBipYUIgNbMTKA5mFq7yMQQF3djKwodt1ZEEMNtjx
         dLyTC8arPZW2qmq8etHujeYc6gWbEny52T+RcSOG4pQmFxLO5bv2K9UIKLE46GpSif0G
         r+Dg==
X-Gm-Message-State: AOJu0YxVvR+ZMcPJ46NUe+6lnDQf37g2vz4slkNGkF4/oqGlsYTmym+2
	M+OrjFL3adhcg4ZlT7ujYrWYqpgX3fDmKuEBCEetp5ac6mgvf+p0lTu3Ov2T8T4dIWkAtVzB0zE
	wbUbnQOWoawrvBT0p8WfySc+0YEMpxIb4aaEFBbpPY8chIvQ5PJhu5As48B3Z6r1+YWYIrFlogV
	g=
X-Received: by 2002:a05:622a:2a07:b0:458:22fa:190d with SMTP id d75a77b69052e-45822fa1b0cmr133915311cf.37.1725890460805;
        Mon, 09 Sep 2024 07:01:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHsTljgmPporyCxrJENBubM/7+40X0JfhGywtBfI9oq4bFVCBl5LQ2MsFsQRPHUZ0vL735WA==
X-Received: by 2002:a05:622a:2a07:b0:458:22fa:190d with SMTP id d75a77b69052e-45822fa1b0cmr133914771cf.37.1725890460157;
        Mon, 09 Sep 2024 07:01:00 -0700 (PDT)
Received: from fedora (193-248-58-176.ftth.fr.orangecustomers.net. [193.248.58.176])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45822e9b2bfsm20680181cf.43.2024.09.09.07.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 07:00:59 -0700 (PDT)
Date: Mon, 9 Sep 2024 16:00:56 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com,
	shahafs@nvidia.com
Subject: Re: [PATCH 3/3] common: editorial: Fix spelling errors
Message-ID: <Zt7/mFCU0t8JEyU1@fedora>
References: <20240907174819.778971-1-parav@nvidia.com>
 <20240907174819.778971-4-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240907174819.778971-4-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 07, 2024 at 08:48:19PM +0300, Parav Pandit wrote:
> Fix spelling errors.
> 
> Branch: virtio-1.4
> Fixes: 5f1a8ac61c15 ("admin: introduce virtio admin virtqueues")
> Fixes: 68f66ff7a3d9 ("content: define what an exported object is")
> Fixes: ef16b644cc25 ("content.tex: spec text converted to latex")
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  admin.tex   | 2 +-
>  content.tex | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/admin.tex b/admin.tex
> index 95054ed..845ca02 100644
> --- a/admin.tex
> +++ b/admin.tex
> @@ -496,7 +496,7 @@ \section{Administration Virtqueues}\label{sec:Basic Facilities of a Virtio Devic
>  than one administration virtqueue.
>  
>  If VIRTIO_F_ADMIN_VQ has been negotiated, an owner device exposes one
> -or more adminstration virtqueues. The number and locations of the
> +or more administration virtqueues. The number and locations of the
>  administration virtqueues are exposed by the owner device in a transport
>  specific manner.
>  
> diff --git a/content.tex b/content.tex
> index 12f9224..c5e7d5a 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -493,7 +493,7 @@ \section{Driver Notifications} \label{sec:Basic Facilities of a Virtio Device /
>  \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Device / Exporting Objects}
>  
>  When an object created by one virtio device needs to be
> -shared with a seperate virtio device, the first device can
> +shared with a separate virtio device, the first device can
>  export the object by generating a UUID which can then
>  be passed to the second device to identify the object.
>  
> @@ -508,7 +508,7 @@ \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Device / Expo
>  \chapter{General Initialization And Device Operation}\label{sec:General Initialization And Device Operation}
>  
>  We start with an overview of device initialization, then expand on the
> -details of the device and how each step is preformed.  This section
> +details of the device and how each step is performed.  This section
>  is best read along with the bus-specific section which describes
>  how to communicate with the specific device.
>  
> -- 
> 2.34.1
> 
> 

Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>

Thanks.

