Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF831FCCF7
	for <virtio-comment@lists.linux.dev>; Tue,  4 Mar 2025 10:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085579; cv=none; b=PnSdYbnig3iL/ZtccWSFJeoslmSwSW0fYCJaC3MrH3iX7L8IP+xS4wX7RbjwnX8CQmI0jpqA7f9Nc3IqPNQ62WBMCdbbP0mpCUptRC23TX/29jXYlzJljKgj6QOAFGJqrE++5nj84eqksdh+fTj3bLVafaTk+GD8smThI0zRmLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085579; c=relaxed/simple;
	bh=UaGW1pCelLiUIFgH9wofJPUK7Wq4MdXtvNu+rHmLXnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=qW/wuxa2IEpcdPKvtfSMXy08k3wlTifQRVMXdYr+GraIzkJaV0EXC4pNbNXbQjhQpCXVmH/6b/eNepEnzjAKAb+ytea15PGOZDn+gO16PDZY74KEs2iNzwgIQ+1MLYrYMGSlixZAOkL/uv/SDnwicaT9aEcXWCfTNuHhVU6UHTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ioJ2RwhC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ioJ2RwhC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741085576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9+tdQW5JlEfrE65CXjs5mEEe393QEWb4qtg18Qr0E/U=;
	b=ioJ2RwhCAryNq4+Q9y8A7e2Ego6/+sPMf3xTq3cAo5v9YIao/eg76Dkjca661tHjGKkQq1
	w4VUqt6G8R76kd3kD4CqHlJUO/qPvZQMd27sHIh7HeGRhQ/YrcgnDbOb/dk6/tlBC3HDia
	XyWxGiPyI12VRttHKWxowAYIl9btE24=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-5XyX7FzwOfCNptyDpJusVw-1; Tue, 04 Mar 2025 05:52:54 -0500
X-MC-Unique: 5XyX7FzwOfCNptyDpJusVw-1
X-Mimecast-MFC-AGG-ID: 5XyX7FzwOfCNptyDpJusVw_1741085574
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4394c0a58e7so38468365e9.0
        for <virtio-comment@lists.linux.dev>; Tue, 04 Mar 2025 02:52:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741085573; x=1741690373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+tdQW5JlEfrE65CXjs5mEEe393QEWb4qtg18Qr0E/U=;
        b=ixeT0xhuzl7srsGcaWx08q2Lqv2sNi7qEETlg9LInw2MqePfWqziXqd1hGYxq792FA
         ARrHTuxJMN13SRy+01OubamCe9bkW2IXuFA5sw12Y6JRipY9WVQdOg1p28QhLO5nBLZ3
         nerW80YLFF8njTMitN7eJnr/WHLys/inH4rYiP3vbmwgBMvzeU2rXR0BHuQxvEY2clEb
         ip0jKb8w9HqkWTwEiY+5XnvdnTl/0aY3YyUCMnhpruzbFma59DfVz6agLfttMy7wavQB
         3b3S4l1YvrpBC45DH5/wGMVfqzGZwdJAbn9TGPRaTsKn7ad0zFv87Iruf8tnhvfxVwxf
         PFlg==
X-Forwarded-Encrypted: i=1; AJvYcCVy9w5Pdmxi6TozBHojGVdHXLbqMgaJ/MeDeX9YVlePXrQLuTm2Fu7+gWDfoGsJXGuY6ttZifeQuTRXEJVVfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyzNOdwWQxeq1s6eChkV+Zfs0n9A7icQ98DUDT66UJLM7n0SW2T
	PlLyNJy5d8p3SrKIVfpKpYWfpKAGdXury5w4zo11Ax8E7ISjG0mbz/0GJ/z7e3fUhMzXYCvhcto
	oqVDKf98knbU9YW3c0Hmb0AMvr/gl9Wbv6MgFwfSPyBmueMru1NocvGmVQpKB43NOICYKHAq5
X-Gm-Gg: ASbGncvxfSXqkzlHuSohk6fjf7bRbzbQgq3ExqMOcnskTSe4r6Vg0cSQ89/ED4hCU0b
	CBONjxtWqdScwG8oI0j42HKEtw2tp6+3kTYntPT61zsQtVcYvPSYwHjFTjfyYoSrZlwNTlpQyiR
	4gpP/mt7QmGiw6Ni8t8F5FlYLkfDuhr7gVn+YpHVHKEybol7GfreXCnWahjbCLIw0kLB+U2bgLS
	LNFJSDcDeiwAG+ZBYd0saynjVRVd8b3uJV0y1cZDI72dBDXEvuhgSE5UUEk1o6wPTf9I5xeURbS
	hfVdqODIfw==
X-Received: by 2002:a05:600c:4f06:b0:43b:cc3c:60c8 with SMTP id 5b1f17b1804b1-43bcc3c6280mr16401985e9.11.1741085573275;
        Tue, 04 Mar 2025 02:52:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1fHPFqDyKPfglyQdoV6SHTvLOlZE/3F/tnVi3zuGn9mcQ8wA8igrGx0p4vZmFzowkll78bA==
X-Received: by 2002:a05:600c:4f06:b0:43b:cc3c:60c8 with SMTP id 5b1f17b1804b1-43bcc3c6280mr16401835e9.11.1741085572953;
        Tue, 04 Mar 2025 02:52:52 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1514:ea00:6409:9e94:fe6f:3eb6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bca8a5cadsm29167335e9.32.2025.03.04.02.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 02:52:52 -0800 (PST)
Date: Tue, 4 Mar 2025 05:52:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Sergio Lopez <slp@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: [PATCH 1/3] shared-mem: introduce page alignment restrictions
Message-ID: <20250304055002-mutt-send-email-mst@kernel.org>
References: <20250217115227.4961-1-slp@redhat.com>
 <20250217115227.4961-2-slp@redhat.com>
 <CY8PR12MB7195A2AFBB7530874D228954DCC12@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CY8PR12MB7195A2AFBB7530874D228954DCC12@CY8PR12MB7195.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bp2qGSnZEq_pwQXoQ2jsrzFTwGv6NnmvWVcu6Q73_lU_1741085574
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 23, 2025 at 05:21:00AM +0000, Parav Pandit wrote:
> Overall extending pci cap structure is not good idea even though it may appear as small change for below reasons.
> 
> 1. PCI spec already ran out of total bytes that can be stored in the capability section. Extending it will not help.
> A virtio level extended capability is not good either due to below guidance from PCI-SIG.
> 
> 2. PCI spec highly discouraged putting vendor specific bits like this in the capability section.
> Citation: "It is strongly recommended that PCI Express devices place no registers in Configuration Space other than those in
> headers or Capability structures architected by applicable PCI specifications."


We can argue about new capabilities, but this is not doing it - it is
merely extending the existing one.

So I do not really get any of these arguments.


I'd be open to an alternative way to discover capabilities, as long as
we don't do that, I don't really see a reason to block minor tweaks
like this one.

At the same time, I am not sure why this is a capability at all.
why not in config space?

-- 
MST

