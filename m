Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3556B15852E
	for <virtio-comment@lists.linux.dev>; Wed, 23 Oct 2024 08:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729671972; cv=none; b=lOS2Ai8uOkmTvsCk1NaVg1jzE+Bp+Mh0QTqS/SOtIinyS6SSeQFKSiRrScmD5r09/VKCsNcHqmtJuIpqQrRK6kqipJoECihVMzvMH+bLjH1AtwHj9dIayiiPLzNM1lhyKVk0YwDWTY5rwzXCMdrcVbh1jLQhL9Lf+klMwdRd/vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729671972; c=relaxed/simple;
	bh=L+bXvuoVqPeLHKXRbTn6tbHxYl2EkFgkA2SkoaYlNwo=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=Hrz9lz4zOY72C6TQPO/KGzi3CujLuD0p8QZ5wOhKHH1tJdG1pR6YymcBqM1rDfnBS5m6t/03h0r/ZW4mdPTaJPy781m5nMHpSumUcyp8TLHC2+Ir8Nx9Q8IQfvaluGAGCQk5vVI+EKcPCVqZW8RxOoXG9x787qnGDem9WC5HarY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hH1dey7x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hH1dey7x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729671968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
	bh=ovt4ipxp4aB7yA7pKS+fVqp8S0GMasisNSHO4UYMSkk=;
	b=hH1dey7xP3XFpxSDF4N4jdDC3yHuTzEqJ8KJJZsbuGqADs79gqcp/9aUqM7bHcc+bkiS8Y
	hUnZvsWkh9mqB9vsZocnWhhvcdnlZKln3ywFqC1/pkvnPCv7nIE5mWuHhACvJnngaar9oJ
	w5jgdlKGowJKEieJ/hU/OX37BwsUnQA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-g8XJICV3PlSMedMH5WJdyw-1; Wed, 23 Oct 2024 04:26:07 -0400
X-MC-Unique: g8XJICV3PlSMedMH5WJdyw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-37d5016d21eso2895532f8f.3
        for <virtio-comment@lists.linux.dev>; Wed, 23 Oct 2024 01:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729671966; x=1730276766;
        h=content-transfer-encoding:organization:autocrypt:subject:cc:to:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ovt4ipxp4aB7yA7pKS+fVqp8S0GMasisNSHO4UYMSkk=;
        b=TfmsNvJ20JrtWOi9ZTWcw+nS/NrXk5Nm3Ciu+3DJbXUWzBPk7XkQEJ6s+coqBAIAiy
         Z6B2ndKuNKnGdFg14FZzRAORKAZFwluW+JCKzQvl3RHqE2LRL08n4X3IYsRJ0HNJwn0K
         5ZTqcBbEwH0o5b9fvxqwXCIS0RKv4PxoK1PFJNdvBpuQsEbPZxh2odxT/R5U+SCySbLr
         K49tX8511iYtedEajzih6wvILowVEAhGhjAESvuQyraJTWLGYHVmHtkOW402lmXVVHsy
         zqCQb06/SEHrcva5KpZOR339xc70OdZAsu+LMgT6BPgc89D5Py3jiR2MGXvzlBtNFIiZ
         f84A==
X-Gm-Message-State: AOJu0YxnAwD59eTDxvuAwcpLduR8FCdzCp3WS6pfqZ5lVjDzNpQTy+nw
	rhlXSoFYque6c4nPfAO0CsNGk+3ZvCMtfWaDwx2AhAwf6V1qzufHkULZDnZETcEoKPOYPNPcmI+
	rP2nF4CbPJUr/lmuSrr9qiRUW0Qnj4KsPnnHLNDzi6k9dqaw6dOI9MDHWSzsWk35ioBlZwOa/mv
	aWgrKmxoFvNZTMv6ZdPic4PyfIv88lyeInQVF0HLBfMBgv1/o=
X-Received: by 2002:adf:fbca:0:b0:37d:4a80:c395 with SMTP id ffacd0b85a97d-37efcf06150mr1138574f8f.21.1729671966423;
        Wed, 23 Oct 2024 01:26:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqQHXA4sc/iu7XhFyB/+kzEE+r0wtRdVGLaQkbdrwQhIjbpJbVKMklLDhOf12j1iWyGPsS0A==
X-Received: by 2002:adf:fbca:0:b0:37d:4a80:c395 with SMTP id ffacd0b85a97d-37efcf06150mr1138556f8f.21.1729671965897;
        Wed, 23 Oct 2024 01:26:05 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70c:cd00:c139:924e:3595:3b5? (p200300cbc70ccd00c139924e359503b5.dip0.t-ipconnect.de. [2003:cb:c70c:cd00:c139:924e:3595:3b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a37df9sm8371870f8f.19.2024.10.23.01.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 01:26:05 -0700 (PDT)
Message-ID: <de252614-a6c7-45ea-a153-115f6851c56c@redhat.com>
Date: Wed, 23 Oct 2024 10:26:04 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: David Hildenbrand <david@redhat.com>
To: virtio-comment@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Cc: Juraj Marcin <jmarcin@redhat.com>
Subject: [request for vote] virtio-mem: introduce
 VIRTIO_MEM_F_PERSISTENT_SUSPEND
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michael, Cornelia,

Can you please start the ballot for the virtio-mem 
VIRTIO_MEM_F_PERSISTENT_SUSPEND series [1]?

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/207

v1 was on the list for more than 2 months, and there was only a minor
change for v2.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/207

Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>


I don't expect more reviews to fly in at this point :)


[1] https://lore.kernel.org/all/20241009090202.10544-2-jmarcin@redhat.com/

-- 
Cheers,

David / dhildenb

