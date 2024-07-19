Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D7A142642
	for <virtio-comment@lists.linux.dev>; Fri, 19 Jul 2024 13:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721395588; cv=none; b=EV759tZ1IE1y2ziH9mHQLLr5823Cn54ZJ5VX9jNoDGp8e8fIoZa6hEkbdNAAmkmG3U5RWive1mNV0vpfga4TfWOLqIIPYsuKbqvmfaFRA1lfe5qtCXgg/Ig8+F9pQJkXsCffBWSyUO4kI4RcPj/R/WjI7SRYDRXHv8MlVqovby4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721395588; c=relaxed/simple;
	bh=/hN4S8YEDa/FoYvwt+xJ+ZxKfxOPvjEiKCHhztscBi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=BEAseSmehOY+htwNZf24kTnSUWEZVScEAd97qEJv3QXP00Kf0DGHSCqS4roxzEhfF9P34j1qoz1OrG66lxf4tMhqVqE6d811HkAw4yQH5523iPlfZ3r6rPwUNseJ5YEyChECTEUIHkLeREDqq1aZYpiZp0/x335At2KOz6ADOPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dYvjPRhw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dYvjPRhw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721395586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yL2iRGgO5qUy5/1Mio1qzccD7wluywrYNtYeUtLFYNc=;
	b=dYvjPRhwUs+JE7tcITP6I9q+YJxSfHH4UdJTgQ0yDv88LBSOwF1doGBkQEV81w9n0+QQxP
	kYUcuXHNaMFu8PCCgUVMkXgw91Ecsd8OJGh2MDJ8j48WXI8PkGcEjnPzLzJRmi5PWRvk4A
	pq6irfLUmZW6l7gaTHT193VN4ev8yLU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-uGSYwRD5MaOC_VQp0sOPFA-1; Fri, 19 Jul 2024 09:26:24 -0400
X-MC-Unique: uGSYwRD5MaOC_VQp0sOPFA-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-36863648335so811761f8f.0
        for <virtio-comment@lists.linux.dev>; Fri, 19 Jul 2024 06:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721395583; x=1722000383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yL2iRGgO5qUy5/1Mio1qzccD7wluywrYNtYeUtLFYNc=;
        b=mATjDBXGxN8tysWU5UqYVybs8BdP1Yp/xxGLnnqhLLpvpdDg1LdODZjulvqce/plp+
         gbzKDrXkkECo+OlfDsDHZcPbVoFENELxB4hIBP3h5PokLbWzIUKEf2G21NbC1b32MwyN
         I/J0fVJlqLqCJuiV8ZVNsAs4KBXdQvSTZebvqc1Qbl28aNpP0pgL+G2Ow2ymmCTjpNDM
         7leJ9yoBZerJY+IOivcSMmqSeS3cKyqYq9jonmvfdQu8jB4giMUlMM51nX+VXOxaIMeh
         4kW3xjZu98DLSC7y/v9RkM9pNjBU3W2XQeHaD9ze1+XAMutHfnkMXb90/uPm5u4GtDg2
         gqRg==
X-Gm-Message-State: AOJu0YxHnvULXjZi+dPJ3i3XXO7qpYFS5F032y2+nlUt8JXJe7EHM1jc
	UkyAC2EHXpWCFQVw6A2f0z9sMtwJ0PjEkalPCHM9hwRhehWmhOpyu7qL2LHrU5VaDrHFZgp0ByM
	TU6FNxKzMHQ0mLFVXNSVrnmxOQV9Jf9vNiwVTiUO8/xI96lJJ6MZr9tiHrtCl7nf8CoBGXlPF
X-Received: by 2002:adf:fa03:0:b0:367:96a1:3c91 with SMTP id ffacd0b85a97d-368317a15c3mr4871383f8f.62.1721395583334;
        Fri, 19 Jul 2024 06:26:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1SFeOi9LYINW2UcLlwbJRhKe7gs5yjge1XTz1e1uymIQ3ULDvz4F66Jswgepb1PXmQ20qCw==
X-Received: by 2002:adf:fa03:0:b0:367:96a1:3c91 with SMTP id ffacd0b85a97d-368317a15c3mr4871358f8f.62.1721395582632;
        Fri, 19 Jul 2024 06:26:22 -0700 (PDT)
Received: from sgarzare-redhat (host-82-57-51-79.retail.telecomitalia.it. [82.57.51.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d6936d62sm24219425e9.42.2024.07.19.06.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 06:26:22 -0700 (PDT)
Date: Fri, 19 Jul 2024 15:26:17 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Wang, Min (Rocky) (CN)" <Min.Wang.CN@windriver.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, 
	Hrishivarya Bhageeradhan <hrishivarya.bhageeradhan@opensynergy.com>
Subject: Re: Question about virtio camera
Message-ID: <5x7rthvgxzu456qezrenm2j6t37drzh5chgw4o2uughxxpxbpg@wjbdmb2ktp6r>
References: <PH7PR11MB855011A3CBA74EFD5FD239ABA3AC2@PH7PR11MB8550.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PH7PR11MB855011A3CBA74EFD5FD239ABA3AC2@PH7PR11MB8550.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Thu, Jul 18, 2024 at 08:24:07AM GMT, Wang, Min (Rocky) (CN) wrote:
>Hi Experts,
>
>I noticed that virtio spec 1.3 has added camera, but only a camera 
>ID(43) is added, the other items such as Config Space, Device 
>Operation, all is empty.

This is expected by our workflow, so that submitters can work on the 
specification having the id reserved.

>
>Is there any progress about camera part in new spec(maybe 1.4) could be 
>shared?

I have not followed the development, but in this case better to CC who 
reserved the ID.

@Hrishivarya can you share some news?

Thanks,
Stefano

