Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DCC79F6
	for <virtio-comment@lists.linux.dev>; Tue, 28 May 2024 15:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716908707; cv=none; b=eANmjCAZNMFS4FaMphXZqCJ9Ap6JayYhEltFNJt/pgBZ3Y1IeYIA/rOYdWSvPYi3Llf665eJVeKcFMrOXmkHueQSn9rWCdkQbycRBF22EabIrMrtdx1nkqF7fgNrR5bMikxiE+FsRwCUCc1MRRG2yD2doSy6nRdgyXTe3tY0Ncg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716908707; c=relaxed/simple;
	bh=HrqvUdr7auIrR/oXzo0OiCZLHDDsriUqKdN640ptUcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=DbdPcoYAMa+1dw9wzI2HcOua0Pq6XtLOm/II1hNcFrjOFFMgjCPPU0ES1kpWxrwjYaLeVbaQqEH4ClWU8PgM4JQToZmz17tvvDLSsUdgPO+yc3T48ezaK2K2Wv51EdqDDV+MCs5M89do4LSlKCNPO35564+x18JszCVruxRIYGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HzQuktNX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HzQuktNX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716908704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Tqf5tSNnS70HOScsovSmn0yo4bU5AJ484mMZL+XXpmU=;
	b=HzQuktNXvO2nnvIPF9IKcJM0fxLKsGNPMY8FLafAtO/31q5SHMiXVjP6bmDGpHzP3Sz1IR
	fPEzHbIWBP1YkHZUZeDK5TFnnU9uGNl0XQwdfEQCche6JXAlmCAfA0AhjWWQz7RF/W6Tyn
	aSPif3JQX5p3pnG8c+FoUfN0z03jgz0=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-GLJCnArkNqSHI8PMTJSjvg-1; Tue, 28 May 2024 11:05:02 -0400
X-MC-Unique: GLJCnArkNqSHI8PMTJSjvg-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2e97c6f1a74so7553811fa.1
        for <virtio-comment@lists.linux.dev>; Tue, 28 May 2024 08:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716908701; x=1717513501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tqf5tSNnS70HOScsovSmn0yo4bU5AJ484mMZL+XXpmU=;
        b=Dknzel8cu1SKKxw2grHgOnNK2xptLQJa6YEscqs/9enoUCYeBZsvE/ckpFUWDhooaR
         Sx+m2Wj320Howr8WiwbxYubr1pXEcIB9tkOE/+NbtflkAr378L7Q4IZbbf5Hq8La5G/N
         uIF2z+Af6pnn1rP+1uWrzAeWbxuYDy1LGGmanbWG6Y48B1tSuHDRsfTM5qWd7B1Kb0/L
         8BIoW5Y8Ph/512XbJRK2oozt4rwTtrbkQn+wPOVaFrPc1JfTdWfsPOLbHzisNVTNxNtu
         F/pivWwxT48eY3N5aiQqVz98EdtucUdfn2sa+0bEQAAzyo7IRMMuOgwPiH+4KbYSxhTN
         8YFg==
X-Gm-Message-State: AOJu0Yzbze8TMEGoH9r7jbkIedk1MwP0D7d49L1sgqH15dZ4Duj3cHZz
	RhSK0qp033Pu0LCEXGYkbQ4J7zPjRI8okcT4woQXB4s8ow3EvEJ+dERKscWzm8cbnYovZ6EHZr8
	8a/GhmZfhXRODa4BGUgt6wYIxJfHU/sAD5TPwQFrZQzkU4KPayQwFBTpCBqv366xG
X-Received: by 2002:a2e:84c6:0:b0:2e2:b61:aa97 with SMTP id 38308e7fff4ca-2e95b276df2mr76272571fa.48.1716908701270;
        Tue, 28 May 2024 08:05:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEWMxHAsle9LvbQZ3ih4mxFhIRO0dhgzPFLuUBtGjbQWWrdziCFMZC32qPkDN5/LVhwi2Oww==
X-Received: by 2002:a2e:84c6:0:b0:2e2:b61:aa97 with SMTP id 38308e7fff4ca-2e95b276df2mr76272321fa.48.1716908700679;
        Tue, 28 May 2024 08:05:00 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-109.retail.telecomitalia.it. [79.53.30.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421089cc4e2sm146424135e9.39.2024.05.28.08.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 08:05:00 -0700 (PDT)
Date: Tue, 28 May 2024 17:04:55 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com, 
	shahafs@nvidia.com
Subject: Re: [PATCH] transport-pci: Replace admin with administration
Message-ID: <rkvznbkvylpld4basur3qxjsmsncawpt2hpwohrrg77yxwp4zc@i3l6t3htp4oj>
References: <20240521122157.2004097-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240521122157.2004097-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, May 21, 2024 at 03:21:57PM GMT, Parav Pandit wrote:
>Like rest of the document, refer to adminstration object
>(command, virtqueue) as adminstration in the description. Hence, replace
>'admin' with 'administration'.
>
>Suggested-by: Michael S. Tsirkin <mst@redhat.com>
>Signed-off-by: Parav Pandit <parav@nvidia.com>
>---
> transport-pci.tex | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

LGTM!

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/transport-pci.tex b/transport-pci.tex
>index a5c6719..2dfbdbc 100644
>--- a/transport-pci.tex
>+++ b/transport-pci.tex
>@@ -492,7 +492,7 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
> \field{admin_queue_index} MUST be equal to, or bigger than
> \field{num_queues}; also, \field{admin_queue_num} MUST be
> smaller than, or equal to 0x10000 - \field{admin_queue_index},
>-to ensure that indices of valid admin queues fit into
>+to ensure that indices of valid administration queues fit into
> a 16 bit range beyond all other virtqueues.
>
> \drivernormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
>-- 
>2.34.1
>
>

