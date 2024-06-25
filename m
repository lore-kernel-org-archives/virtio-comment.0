Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CB9144312
	for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 07:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719302124; cv=none; b=DzneVrurMfZ3JE1qZyiLvIuoMv36h43rD/bHNVpliuCIr1vbuCQm9QR2KS4pWBpMgKufd12Ssa1r0EWRqiOU61gwoDjqh1mqlXjfL8360vL1+OPda33dc9BeDZAkgaHwTIfUFmK/3jEPDZ+JMSfRbYJtkNePLXuMtKV4Rzxb8vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719302124; c=relaxed/simple;
	bh=3aajjJvtHLaqyl1kraVcqgwj6NMiMkgDykUNQs6NCs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=jBALnqWH07WWOAiP4HpIHkNJCk7Z+gwG0cHnC6w+H4xJ0m7QwSWWIiiOnHiGTfg9PrqecDl+VtGKRDY1z2gEdBjAvsMqWu/yWub39GNC9ine0fHBsE5bxLxsUnsu8honA7rKErNK8IYrIIzd8lYADhdkXuQgLtBnZZUJMNPqc78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F3QudibK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F3QudibK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719302122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QzJmS2EyMPTF6P+ItAGwrBiGUYos9y0lqawJy1g/mnY=;
	b=F3QudibKCXkCizaLsMWllMkOjPB98TFA2g7aAXxwpla6nlFK5oyOaZy1jNzPXRn06rcX4g
	35PNegfXQ1CAJl7122PRhi/1S7iaDtl35qkN4sCapOYIDLjBIlq2qSLjkJvjhAsKcuMqn8
	MnT0FU5lsh0bGj3WIEVu62zho72S4H4=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-NbYqnrYkO8i7t7bDQLb1zA-1; Tue, 25 Jun 2024 03:55:19 -0400
X-MC-Unique: NbYqnrYkO8i7t7bDQLb1zA-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2ec4e579e76so28228361fa.1
        for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 00:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719302118; x=1719906918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzJmS2EyMPTF6P+ItAGwrBiGUYos9y0lqawJy1g/mnY=;
        b=WnurBPxOO0oiEpuB0vKINY11k5r4PqPeOvatDsi6baB4pHo12/9ymS2zwM9QUCcre7
         d8B3/+7LnhT/pgISArD8xDYTxH3Ga2CDGBA++3/QNBeb3bt/YIAIiB0znTZMJYzYvFcP
         PLriJBFduhJaJex/4aBOII9rMHI8yuszr++Cy0LjVlcvYNl5AlkkpBFoCGWEcm5XK6Em
         HBdsvtl/OwRrxYJ4ADi+qYgHtOGuyyy3qBYWsrp6QCAIzYOl2dKJ3kYbCf+UMPFSjbvr
         lrZhWD3We4MmFbWOU4xkdN1wmTmRgbdBe+ywYdQq03LbrXiPDkK1+xtjJXY4Idqwo/lg
         Xy9g==
X-Forwarded-Encrypted: i=1; AJvYcCVckU3zNY2S3jQvHLjI5HqV/ygAmultX25UjXr/e2t4lsYrP5LsK2QBUR/C6VxhBBvHFkA52Kuhcn/vZFdB7/o0RFnTaxQTEL9d39KEBT4=
X-Gm-Message-State: AOJu0YyDk4OTWaBmeLku39aAmC1afm/zNlMenwEaknG9ZnPF24NEZEJO
	2dJqrD/V5NNobmnpDXlXIUHpoDpIQd2XaX1rRJaEGQyjWaurS5p28z+hIDQ20gIwd7WrApBHLPV
	AutlwDz8IFQdM9/FDQ412afa8xh3f0gpHyZ8cp4FeBzRsxvLbU6bx8zYtM6wBmrDl
X-Received: by 2002:a2e:bc17:0:b0:2ec:6608:a3af with SMTP id 38308e7fff4ca-2ec6608a787mr24114451fa.31.1719302118091;
        Tue, 25 Jun 2024 00:55:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBdedIucMpiKdgPNPkFcucsHLMACw7q081qZBGLUPeQqEv/Fve/2ptwOOnD0yzMRhrMFGaAA==
X-Received: by 2002:a2e:bc17:0:b0:2ec:6608:a3af with SMTP id 38308e7fff4ca-2ec6608a787mr24114191fa.31.1719302117344;
        Tue, 25 Jun 2024 00:55:17 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:342:f1b5:a48c:a59a:c1d6:8d0a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366389b8922sm12133278f8f.28.2024.06.25.00.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 00:55:16 -0700 (PDT)
Date: Tue, 25 Jun 2024 03:55:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Manivannan Sadhasivam <manisadhasivam.linux@gmail.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mie@igel.co.jp" <mie@igel.co.jp>
Subject: Re: MSI for Virtio PCI transport
Message-ID: <20240625035343-mutt-send-email-mst@kernel.org>
References: <20240624161957.GB3179@thinkpad>
 <PH0PR12MB54812829338B9B950001BA9BDCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240625054346.GA2642@thinkpad>
 <PH0PR12MB54817F3736022FFE3B9C570FDCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54817F3736022FFE3B9C570FDCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 25, 2024 at 06:18:46AM +0000, Parav Pandit wrote:
> > So MSI-X is clearly an optional feature which simple devices tend to ignore.
> > But if both are supported, then obviously Virtio will make use of MSI-X, but
> > that's not the case here.
> > 
> If both are supported, and required scale by the driver is <=32, driver can choose MSI due to its lightweight nature.

Unlikely, MSI vectors are tricky to mask and this is a problem for
interrupt balancing. So MSIX is better for performance even if the # of
vectors is low.

-- 
MST

