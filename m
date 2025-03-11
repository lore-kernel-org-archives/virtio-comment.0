Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416791C6FFD
	for <virtio-comment@lists.linux.dev>; Tue, 11 Mar 2025 20:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741726063; cv=none; b=Oc81uli5WFb0sSYmXrLqu9iLdlIIHP2OYTy6swEaX61zyrqYqTlaz6e3Sdfa4ck5PKdJQtJtSKKOdFhUyZi7+dc2To9moq761aQ1w893O+NIf8Qhrwp7LN+tJ4IU1YNmqk6+MsQV1uMptgrygQ6VFOdQn+J5PjY6s2V7kLu49bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741726063; c=relaxed/simple;
	bh=GHTHc1/q4cPsEBZdJb250yUzhFiGI30Zcd6W/9JvgPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=hLo5SA8jzhGwiErExTPgBTcDxSEWHgX0jSNb/rySvoIkw7f/3Ac/EUidGuvqo3PmKipb9UDsSwg2Dfyvc9EUfEghSs5MCowgMwPx+Kx9dmLSl6L+L690FLG+u94MC5b1JQIskuRzwR8HI1oNn58F55OD+vb5kdBTcRuFmkAAH80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ONRwDCNp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ONRwDCNp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741726060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=91rp29Ca/4/D1Vpnv7QrYOY5Xb+PjDfGZj5Dbsq8ypQ=;
	b=ONRwDCNp1h5sTjZa9bKVaIhAmBFkIBFWRa16+W9wfJC1s2jQvfD+dgou9r2efEWpjRvN1M
	RnCfLS0ohum78VsaRbEg3OL3TCMFjRtVTNzSEus0LoMn139Ow6sOiw7w/P0nrLC3ctudZJ
	QKF4wGxroenJ/fW+P0z3lf9yJCOiULw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-CMN4XAxMMRmT8Wg2iEmuXg-1; Tue, 11 Mar 2025 16:47:38 -0400
X-MC-Unique: CMN4XAxMMRmT8Wg2iEmuXg-1
X-Mimecast-MFC-AGG-ID: CMN4XAxMMRmT8Wg2iEmuXg_1741726056
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3912fe32b08so3145366f8f.3
        for <virtio-comment@lists.linux.dev>; Tue, 11 Mar 2025 13:47:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741726056; x=1742330856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91rp29Ca/4/D1Vpnv7QrYOY5Xb+PjDfGZj5Dbsq8ypQ=;
        b=l0U2MMRmAFu5snbLCMi0rlcixQ05PRmlJ5laJzo5bNlMLgkLqQAupzou2yhuNsHjPz
         UOh4AZs7OtXJ4jSgQ07lOKPSnmHINUE0Zdm4M7M3VoBs5jNoF9vM6vfW7nu1kwrfbN40
         rVtFACgUuEk1YKrAuiogWM5cj6K7MFnt+Bggcy8Y28Npv1LuXUlXwH18xBvZMF/9NA/g
         LKqB9aA5Dc9h+eDuLVlSTHvqR3q3tjr4g8gG/3rFFAnQY9QVaAm8kJCQSuI3z+x+WMq2
         dV+DomhWKYY45jLZw7ToAfkcdBLcsuUFCIWq6gq9gj9boXNb1QWg8tyLoJd9TypA5LDH
         VGYg==
X-Gm-Message-State: AOJu0YxLq0hCL3mkVGD26kkIhIe4BO04825sMcZKCVMbdbjOhs5vGWfr
	dZA8xlt81nyE2HDq/inm5OnhiCv8k4RogElWfJs2wBictj//gKssDk9D7UU12Em+3APieKFz4TI
	71VSuO+3/e/rcDQ0ss8Z/RzMf9U0mAHaNfptIivRDpobkPU7qfrqCU4GUEBu8Y//j
X-Gm-Gg: ASbGncs46w0AHtY1b6rTu9wBGZKlNpXbY7UuKwYLggE/ihJRhfkRGw+rmO9dqQbcHwX
	GBAVrgeW+dY89MMfH9Nc0IMfvAsmfjvOT1G9ztKj8XaK18bheRh6tbWQxw13xIxqebjlSmdyQAU
	1BIQPstfOwcmRhUcw3iQwNaePRCku1Dvpzphb4MU3bZe+5vIuz39dS+cFkKeCN8BEugMxFwRgky
	1jwSwQj9ffrHI0UA/bUin/9Hv1Baxcm4jlkEEk0sWzC9yg34kEPemph7jxBpUkele8/IvcG5ny9
	b+O6GF4r5A==
X-Received: by 2002:a05:6000:1f88:b0:391:3207:2e75 with SMTP id ffacd0b85a97d-392641c02b9mr6661410f8f.18.1741726056004;
        Tue, 11 Mar 2025 13:47:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwhDdSDIswPjIqYuKMu5/47Gl7tQk1uMk73+AXBb+NOKTGccp2UgEE7zZABD2aKoht3xl07Q==
X-Received: by 2002:a05:6000:1f88:b0:391:3207:2e75 with SMTP id ffacd0b85a97d-392641c02b9mr6661403f8f.18.1741726055694;
        Tue, 11 Mar 2025 13:47:35 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a79a6a5sm422085e9.37.2025.03.11.13.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 13:47:34 -0700 (PDT)
Date: Tue, 11 Mar 2025 16:47:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev, cohuck@redhat.com, parav@nvidia.com
Subject: Re: [PATCH v3] README.md: add example email for TC vote request
Message-ID: <20250311164708-mutt-send-email-mst@kernel.org>
References: <20250311170352.1737287-1-mvaralar@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250311170352.1737287-1-mvaralar@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zjlGxdXTUcGqR1sBkYJKksAL2RKafnpXFxpvlek0G_0_1741726056
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 11, 2025 at 06:03:52PM +0100, Matias Ezequiel Vara Larsen wrote:
> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> ---
> v2 -> v3: use "()"
> v1 -> v2: add Subject and To
> ---
>  README.md | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/README.md b/README.md
> index c06caf6..8e7e6b5 100644
> --- a/README.md
> +++ b/README.md
> @@ -206,7 +206,16 @@ The mail requesting the vote should include the following, on a line by itself:<
>  <code>
>  Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
>  </code>
> -(NNN is the issue number)</li>
> +(NNN is the issue number)<br>
> +For example, you can use the following template when requesting the TC vote:<br>
> +<code>
> +Subject: PATCH (description of changes)<br>


Still wrong. Should be:
	Subject: [PATCH] (description of changes)



> +To: virtio-comment@lists.linux.dev<br>
> +
> +Could please open a voting ballot for these changes?
> +
> +Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
> +</code></li>
>  <li>Please make sure to allow time for review between posting a comment
>  and asking for a vote. </li>
>  </ol>
> 
> base-commit: 124fcd0e97f209aab19639e7369116d99ede22a2
> -- 
> 2.42.0

