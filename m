Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DC629422
	for <virtio-comment@lists.linux.dev>; Thu, 23 May 2024 08:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716451824; cv=none; b=f7Re4ehc266vje/E7U/GFKrqMLEJ5DTtnOaCN0JG4hoyPqaEZHFYrLWNRwDrDlpIGT0hd5XVIr+1s7FmGYJIV82Lwb4XTAnEPcRDuOX4LkprQkdfyLKwBbZKvi925o+l6nxEKCadjt/rAoui7voToyDBSze2YpqQIMGxw6ABXhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716451824; c=relaxed/simple;
	bh=l9f+M1vIQ3G5MlCl2H1coCPB7B/WOOLDwk4lkOcDR+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=jafaixzfFgSxwFmBlsc7dTwQnzU5w979IxiXlwx1twDwKI//1QH8YDqM+67pIl4CvK7v+ueBrZ3DzgGF5a4nq9vzB2eXZtN7mj7IgzLqs2aAGkx3zDIqszb+rMIieP1hXmp+mEy3NO1kcLlaIXxDbJLwtu58lyVRspMk5CN2Sc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DarStEqn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DarStEqn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716451822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mzfz7aJ/ibsWH0/y4s0m/Y111uvKmj02C5E2cXh4O38=;
	b=DarStEqn6RTyG3UvKWduG+5619WEpFDwjQUgwmy2tmCW6MVDRzwBOyfYkdY71akwpq4tnf
	YuV4i0S+xw2qoDRSXrnLR5vwL8CGiFPZdQnMRohaboyr4qFjIWnzud+9OLdDZE9eWMmqs4
	SzcP0bGKAqbz512vnx/KORgyA0GI2Wk=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-depAGb_KPWWdEE1SfnyFkg-1; Thu, 23 May 2024 04:10:20 -0400
X-MC-Unique: depAGb_KPWWdEE1SfnyFkg-1
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3c9953e04c7so743202b6e.3
        for <virtio-comment@lists.linux.dev>; Thu, 23 May 2024 01:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716451820; x=1717056620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mzfz7aJ/ibsWH0/y4s0m/Y111uvKmj02C5E2cXh4O38=;
        b=MmjJl3Ala3BiMVpE1uRg9uZEA6KwvVm3trfgMY6UWwXEXsSuJ35iolgGWJRUm4kFuj
         kAxAW0+lTuyHzDdRacEyXmcZjZ6PP6f+//LZpczHtsSSIzBJogCEeJ5wHdtIja0M92z7
         cWDQfZHgduuDZR+ZERNtLikGtFa28MYivti8X7sFplPZMO3lgARTkXqUyUjq1I6yAo6q
         hTxjHwkz/C/HNWu+7DGP7A7nhvak5qwfJGTTqgF3REGcYeENn0lih1XiWR7tQ5zPqwyb
         08A6Bl6pjGz9NjYJ5P0NHDVTrOW/cQ4bjsFNUqiF4ad5hiqLTLygB8QNqa2GIjRoUgip
         5MTA==
X-Gm-Message-State: AOJu0Ywkl1xEupBecdCZrXJn1kYmh+u59Wh/CwHAfukQkBXNgjW/Xw6B
	alEJa+OkZMAYMJ89N+pPzrxY+2YkHdCZ7yK3NqyfcGX4GaWnI1jif5Utq92bpvRtoBJ21woaNgD
	y2675WbPGiqV0Uiud/mf0TbFvgsw1jvkpygo7BXPYUxTiRce0L7q2CTS9z4yKwZzq
X-Received: by 2002:a05:6808:2915:b0:3c8:6543:584b with SMTP id 5614622812f47-3cdb8179d79mr4351900b6e.54.1716451819834;
        Thu, 23 May 2024 01:10:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv8xPDlSIBngIFuZuMTuG5m3/HqVZQor6gptf5qZEKyhNFlc7YFx00NS1HjYzZrzrfTD9aOw==
X-Received: by 2002:a05:6808:2915:b0:3c8:6543:584b with SMTP id 5614622812f47-3cdb8179d79mr4351886b6e.54.1716451819514;
        Thu, 23 May 2024 01:10:19 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-109.retail.telecomitalia.it. [79.53.30.109])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf2fca82sm1463857485a.89.2024.05.23.01.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 01:10:19 -0700 (PDT)
Date: Thu, 23 May 2024 10:10:14 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH v2] README.md: remove duplicated word
Message-ID: <34cparcvc2343gqfcnckadvlm3dnvcc7tmdh722k55se6bc4bm@3gmr5r5t2npp>
References: <20240520134331.4043979-1-aesteve@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240520134331.4043979-1-aesteve@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Mon, May 20, 2024 at 03:43:31PM GMT, Albert Esteve wrote:
>Signed-off-by: Albert Esteve <aesteve@redhat.com>
>---
> README.md | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


For the next time/version, I suggest you write the word removed.
It was a long sentence (not your fault) and it took me a while to
realize that it was only describes at the beginning that was
duplicated :-)

Thanks,
Stefano

>
>diff --git a/README.md b/README.md
>index 1fed245..089db50 100644
>--- a/README.md
>+++ b/README.md
>@@ -11,7 +11,7 @@
>
> <p>This repository documents development processes and hosts the tools used by the OASIS Virtual I/O Device (VIRTIO) Technical Committee.  See also the resources in the <a href="https://github.com/oasis-tcs/virtio-spec">virtio-spec</a> and <a href="https://github.com/oasis-tcs/virtio-docs">virtio-docs</a> TC GitHub repositories</p>
>
>-<p>VIRTIO describes describes the specifications of the "virtio" family of devices. These devices are found in virtual environments, yet by design they look like physical devices to the guest within the virtual machine &mdash; and this document treats them as such. This similarity allows the guest to use standard drivers and discovery mechanisms.</p>
>+<p>VIRTIO describes the specifications of the "virtio" family of devices. These devices are found in virtual environments, yet by design they look like physical devices to the guest within the virtual machine &mdash; and this document treats them as such. This similarity allows the guest to use standard drivers and discovery mechanisms.</p>
>
> <p>The purpose of VIRTIO and this specification is that virtual environments and guests should have a straightforward, efficient, standard and extensible mechanism for virtual devices, rather than boutique per-environment or per-OS mechanisms.</p>
>
>-- 
>2.44.0
>
>

