Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0547213C67A
	for <virtio-comment@lists.linux.dev>; Thu,  6 Jun 2024 12:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717676600; cv=none; b=Nj014TxJquuYzETUZoSwTZZpST0HvkrCakgnhzTBTW16QCWO4njC9TDbM+dXzKw7SNSmj0hX099fJxZJbDufj1PNIctiDZHR/XAHqeCgIKr/TvIH9apuNXfJbKia6QDVeFDpsze/eCflpOuI6/NgIK5eNfpeVddR2ex8lNSwHJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717676600; c=relaxed/simple;
	bh=Gu47D6HxYX5dgrIceBmfmfNJY+iXUrHTQtuyO8C/eDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RF7P/mgXZy4f0/tbmn8JAJ5YfRjsRNWSWdZ486/YNVbSyXfoaFhGMBn/FDuBI2PpDBw2f2LAOv/dO/aEStfnPBjetdNt1yo+HSONhe1+5/VV8NjfZyUcGvdgI80qnfLqLUFXrl9bdo8DTdpUtd+PedDsUjyIqBfbBOcq6p9Rvx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V5CSgfv5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V5CSgfv5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717676597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=714z7/ZXGCMX5JFwFfBAjrIjzcpzP58OfY2KU7leh7k=;
	b=V5CSgfv5cW1cWJz7s1O6cwqmvUZjYYS6cRGPF5LzoKSE8UdL2cKrBluGUla4M3qbDiAg3M
	kxd6v0LEqSt2m4rk+yxhzZfVmBTUE1rUZpPhwhYPXME4KT0jCs2Grsnt/gwOE5LB4lt7MX
	7iHVMEdiKThX6SoYGm2/aAVu8IDT55Y=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-ClpFAdv1PYWXT9zoy6YedQ-1; Thu, 06 Jun 2024 08:23:16 -0400
X-MC-Unique: ClpFAdv1PYWXT9zoy6YedQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a6a335e0b2fso47859766b.0
        for <virtio-comment@lists.linux.dev>; Thu, 06 Jun 2024 05:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717676595; x=1718281395;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=714z7/ZXGCMX5JFwFfBAjrIjzcpzP58OfY2KU7leh7k=;
        b=VV4udAdK4zm2utJIS0YPJed+LprQDWZ2oxA5sG7fetlZ2SEeNo1mziDR4/6fhccrPF
         1wWlyVYWPOZkv9KQxudT6hiYLrAq+t1/iA0rt1iZAHCU52V8o7rVkQRIQIxiarhVI5C7
         uUOsGAcMDtOK9s5fTOJ6NIAag+wb4exjopNCONMHoLspwcQojynTnHnLLw9MF+myTRXy
         dnx6kTvO9WNfgdlsQPB4HDhbSsmb/MKNcUy7h1dHtOMppnZBwg32jBRUAe/8CBlp1CWr
         1PP6PXJFUvFzobSxF+peI/xkjuUYigCDchKELkpvNVa2JUtJ6FfbRz1qZNijmIiIdjwU
         AM8w==
X-Gm-Message-State: AOJu0YyKTjWD1XobBmMH2HcYHbQn87UWnhmsG+aSGK4YBqlMqlblx8vo
	1gF+0WoaG3BPDhmeHojJhLF9JONa5B82h9tVsMn/69sgo28FNA6rQcaED+IdX0byXnxCppxuNrQ
	DX6pm/xl/dCEzSsPCp64CgUvIn7z1juMGz26Y8JNg227wLHoYOF7hlk5f5a3/BSgd
X-Received: by 2002:a17:906:3c54:b0:a68:ed0b:8924 with SMTP id a640c23a62f3a-a699f362210mr339232066b.16.1717676595348;
        Thu, 06 Jun 2024 05:23:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmnZBtw7NhdACctBFtWQAzZMzwpcrd/vxWHvWrSP+hCquV8JP5znQE472ipayjFBm0bJA6pg==
X-Received: by 2002:a17:906:3c54:b0:a68:ed0b:8924 with SMTP id a640c23a62f3a-a699f362210mr339230466b.16.1717676594819;
        Thu, 06 Jun 2024 05:23:14 -0700 (PDT)
Received: from redhat.com ([2.55.59.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c8070e2cesm89245266b.163.2024.06.06.05.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 05:23:11 -0700 (PDT)
Date: Thu, 6 Jun 2024 08:23:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: ballot system back on
Message-ID: <20240606082035-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

So, things seem to be working, even if they are
now a bit harder to set up.
Let's start wrapping up 1.3?
I think we need to pack up and then do a ballot to ask OASIS to get a
special majority vote for us.

Right? Cornelia, want to start that?

-- 
MST

