Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991B1260590
	for <virtio-comment@lists.linux.dev>; Mon, 16 Jun 2025 10:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750069825; cv=none; b=O4MmXK5r8NDl0O9Gh7P0mp0qvidMRp8B6W6yUCTW9TTixnBC1TDIGvSWddPd7XuH2AuxdAmUNM1jpf1nLAMKlF5Kra0ab0R2uws70eA1FAlvmcjxnOUzwxKZLHx7dJPAjUH1AFy49QJRhwYv/Zubq3BRxfdRDXDDaJ5+XsQ4f4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750069825; c=relaxed/simple;
	bh=OfQdCCq0r9UzpPahLlDY+e7PO3FXQaR04lC/NmItg1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Wp0jMMOCz8Y43Bnj5p0fPzeaQfkyExR1WY5HUS04p8BrxoGKa1Soirsl/t9874R+Ith/6HBVkRzu5P71eOFQblhOb8c4/Y1TU37rY+SnBMgmapzMPDIhlb+D+3bh8/S2SVBkhzkjdYVKbZgfgDIdkUZKcRiPFltWcq6GTze/0ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EWZFE0Kc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EWZFE0Kc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750069819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=che9NGZup3J6SU+VOcJD7hb7SRP/ajZDXRQudYYzK+o=;
	b=EWZFE0KczfijXNbWYqnHgmOJkNffaJNlcHDt6vmYN7pMJxbrRJ2xmpBTSoSv8KqRwvHL+d
	BtfIqq0jhMrEAahSzc6BTf/t4FAenD9VjHe0qggsrBPfkT9iVwiL2ltXwXKQPqjk6zmSGz
	w4z0pVJtwKp7qzqDCmI+0m+dS57eT08=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-a_b4zddkN8eO9aN6SS5vKw-1; Mon, 16 Jun 2025 06:30:18 -0400
X-MC-Unique: a_b4zddkN8eO9aN6SS5vKw-1
X-Mimecast-MFC-AGG-ID: a_b4zddkN8eO9aN6SS5vKw_1750069817
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4eb6fcd88so2627999f8f.1
        for <virtio-comment@lists.linux.dev>; Mon, 16 Jun 2025 03:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750069817; x=1750674617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=che9NGZup3J6SU+VOcJD7hb7SRP/ajZDXRQudYYzK+o=;
        b=OIJ0sN2QoILqjtzLYZZxrNYuda65de/HQu880802NAmLDbPa0LrAL+Onjivhz3ywig
         mBo+5OowmYI6zOPQIa5KqbtFb/00536clQOS6Xa4ZCyIJxTi/eCVluqWA6FjDnC8HsLv
         M3AONnAfRlzlpRLsQyyd+B178aKYIlqF9x6jO+4eqs95BiDmxbpbyh0B/joPh8PdINKL
         9FGW+yoyWqCfUv4Pqm2WnI76Tz6ISpp09pFB8RI85Pk/ox4S5YZbU8yOINFNy7VfwsCF
         m8UvJkTkwjbYM3HuLZtU9VKQzlTh6bJ6cfIodXiPcUpoxGnBLSa/kpxT+TqVY5eqUzUX
         y50w==
X-Gm-Message-State: AOJu0YzCVb+O3brYZxBHcYVLZwFs2FJDtp9MBwf1gKspg9ENpM4cGP21
	iP09PeBvOv1/96+q6U4E8Sf46J29WSUV4OjebLW02mc3gxHwy4QAz8RnS7ASV+n3LqgxYgDoITa
	rqIfGovahASdvsMUV4Qd0G2wK+vJhN0SHq5zEcvp9Iv6tng/LZYZqHCWiZONKh0QoflT/
X-Gm-Gg: ASbGncviWchqGceq0bFiZUXeDbZ2Rdm3KYo58zCA9wEopdQSdpR2iUphqoJh1NyPbkY
	qQstvTc7R1FGolnifS0NC8Juol9CDBtupX61Z9s8zMBVAlBssb9uGDCuW10XskvXPx0VjQYhN8A
	c1Sm1Lq+mmQe+gArjJJej9PF8AK77nOMh63clF6aE+m/p1e6gBMgLvlN2gdTm2LIdqVfiYIhjkG
	fj92IBC1dZsCQTV3SrPMw3RhH9fsGr4BeJK9lL1Le0efol4do8xkDzgh/1/pp6X6/8A2zkEsmsR
	rilqFnaqQGhWXP1o
X-Received: by 2002:a05:6000:1887:b0:3a3:7baf:f06a with SMTP id ffacd0b85a97d-3a5723a365dmr7513466f8f.37.1750069817293;
        Mon, 16 Jun 2025 03:30:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+njyhY6xIz5DBsc0hW1EagJAgvxJhhSPfJieY1q4LwaDGY0HLwhbiuxzUWZpCCwa6AZY5zg==
X-Received: by 2002:a05:6000:1887:b0:3a3:7baf:f06a with SMTP id ffacd0b85a97d-3a5723a365dmr7513442f8f.37.1750069816904;
        Mon, 16 Jun 2025 03:30:16 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b19b32sm10827592f8f.67.2025.06.16.03.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 03:30:16 -0700 (PDT)
Date: Mon, 16 Jun 2025 12:30:15 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com,
	slp@redhat.com, shahafs@nvidia.com
Subject: Re: [PATCH] virtio-gpu: Fix missing driver conformance file
Message-ID: <aE/yNzLLs+lZh/we@fedora>
References: <20250614181302.277794-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250614181302.277794-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k1koURNf15pBLPaNZC6iKIbRKM3ULzHpYQVmSisl_aI_1750069817
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 14, 2025 at 09:13:02PM +0300, Parav Pandit wrote:
> Cited patch in the fixes tag missed to include the driver-conformance
> file. Add it.
> 
> Fixes: f52fb20cbe38 ("virtio-gpu: support blob alignment information")
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  device-types/gpu/driver-conformance.tex | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 device-types/gpu/driver-conformance.tex
> 

Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>

