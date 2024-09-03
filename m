Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5CA1B12F6
	for <virtio-comment@lists.linux.dev>; Tue,  3 Sep 2024 12:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725366320; cv=none; b=AbozqiZoucLGbLLnRURfPrlQr4OcVzopKH7ROLr1iZsKJx8V34/lqbIiu7eQQfjJxd7PKn606JCeyeDhPFb7J5NvI/W05EDo3MNU5qHVRYnY4g8eDUW5ifmue6WTjlPMv6jTRkKkbXlRLg1qyoDdzuTRRQoUqSIBhMeDKOLChNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725366320; c=relaxed/simple;
	bh=jtlQo7uDJJDKsbP1afD9Gh3LyOYm+An7xnVQeJD1cyA=;
	h=Date:From:To:Cc:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OB+XLUND297gK3khAa/k6N6ueg1ELNhGWSKay5AaB3ND1GkHKVCIPA4i0UQ/FHYYSSPBo512ME3LlxBkFeVMW5QdiCEaXRkG7fPc76JlnDlJcmKHVBRxdStInEc6RdesS6CNKg1FVEdfAOFgXyUW4JRLVu1KjyyblzhlmnkOQik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NDshhgra; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NDshhgra"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725366317;
	h=from:from:reply-to:subject:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wbOqBd1MKXq7wGzc96fXF5e7dx3Q7xLhNFO3/HhiTNI=;
	b=NDshhgraXWMjLCOt0By5sgDLsNRWcE3xY5KfhJBXYFDwkoLA2JYhS0B/YqnX6x03Y6EPIH
	RbBXJsi73U88w0vazBwHBmhVZkyd986OW49V3DcLxXgpVNknX8PypjPKM+ssSr4wO48V3u
	kn922uUWM5kjpHBCpUEUkTJNeREVd7Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-Dz8_ft46NaCtYDr3TR5dOw-1; Tue, 03 Sep 2024 08:25:16 -0400
X-MC-Unique: Dz8_ft46NaCtYDr3TR5dOw-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-42bb6d3cd05so48590315e9.0
        for <virtio-comment@lists.linux.dev>; Tue, 03 Sep 2024 05:25:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725366315; x=1725971115;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:cc:to:from:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wbOqBd1MKXq7wGzc96fXF5e7dx3Q7xLhNFO3/HhiTNI=;
        b=Cys08H6m2KtB5AV4kZTQRyOb4VbXqXqgdmtaAr7wfwNcRUrBjqKZnegLmL5xHJYmM+
         e4Xkk3I4YejLtjXp0znOKkHQ2JNyE27r9U6aWxMj62oYgCdIG3EgeUo19hGfnfqj9HGL
         seMX3m31uBP6J4pWNdtvMUtFz+UEEEoJj1sjeMUWBOaSvbt1uvA2Ue37DaN/ctd+Zk0O
         6oVinBMse466PaY5CVTuIHGMxeRdxNPs+8vvA71w5cc8i/cpSjH8b5IwLVAAP8L5w5w3
         ReAYg9AG8kNyMBRwzCPTTxk+HTi7+otrCdR2Qz85kMfwVYYbOzldX4U+H6ZwFFDiIfst
         sBDw==
X-Forwarded-Encrypted: i=1; AJvYcCWwBYp7v5G8Elp7jbQnxues+6rw2hciyQ6ZwAS3pSKnZdDSxToaHnIKqQAh1CoiUdb7F1BQaqhgamnC7KTL9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwtWet4X4RbVbWDAeLyjHqquBhsSOkTvAmtX4aDEinUeO3AaljP
	/AWxOSJHaHq7DSkAmU9sQVOj1FYxuTnpCEq+L7NPAOldvq+4tBFQhK09iVkwEwcOtR7HfMmk9U5
	XH1Ad1YSJ/SwdKLZGjdoTxzMmvTlGP1+iOL9/5cV8NKYreFC099voWm2znAU0dspJ
X-Received: by 2002:a05:600c:4f93:b0:426:622d:9e6b with SMTP id 5b1f17b1804b1-42c881030e7mr25695715e9.23.1725366315180;
        Tue, 03 Sep 2024 05:25:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfvJNx5qxAOcWLzJSXcXtezGID/064s+7rvveWokEa4BMb2p2+ZVOvl3jjTTXzZBDntHn9LQ==
X-Received: by 2002:a05:600c:4f93:b0:426:622d:9e6b with SMTP id 5b1f17b1804b1-42c881030e7mr25695385e9.23.1725366314279;
        Tue, 03 Sep 2024 05:25:14 -0700 (PDT)
Received: from redhat.com ([2a02:14f:17d:56b3:989:4bb1:d7f5:6b9e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374cd32fa01sm4651902f8f.85.2024.09.03.05.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 05:25:13 -0700 (PDT)
Date: Tue, 3 Sep 2024 08:25:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.linux.dev,
	Kelly Cullinane <kelly.cullinane@oasis-open.org>
Message-ID: <ZtcAJTFe9x6pUubT@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Bcc: 
Subject: Re: Request voting rights
Message-ID: <20240903082453-mutt-send-email-mst@kernel.org>
Reply-To: 
In-Reply-To: <CADSE00KfhP9F9yovyxyQsyF17TXs6DV2Gr2kbAUGKemps9NuMw@mail.gmail.com>

Kelly, could you act on this please?

On Tue, Sep 03, 2024 at 01:50:38PM +0200, Albert Esteve wrote:
> Hello,
> 
> Little reminder. I did not want to bump without checking if the request was
> already acted upon. But I think I still lack the voting rights.
> 
> Thanks again for the consideration.
> BR,
> Albert.
> 
> 
> On Fri, Jul 19, 2024 at 2:50 PM Albert Esteve <aesteve@redhat.com> wrote:
> 
>     Hello Chairs,
> 
>     This is Albert Esteve. I joined virtio TC some two months ago.
> 
>     I would like to request to be a voting member.
> 
>     Thanks in advance for your consideration.
>     Best regards,
>     Albert
> 

