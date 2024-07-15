Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE9C175AE
	for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 16:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721062202; cv=none; b=g+nUFkDkr4uqltopyENxgQztddMV3bkJK8CvAv1QyIhz4yFNZpyapyv/aL6e+aD8BBIiZNfbJ0lT8GlMjPDxUzFhBTwpKPNRkWJx8KqTvoOfK51tvHTFlAxGVlPOK8vmLCxoMPP6NaUXFKF407vWj/z6+WRKyL0Wl80lXfRUJMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721062202; c=relaxed/simple;
	bh=2WGSJWE+AcG/GLFxuvFXn4ofZm0LFooAsfLpe3e0oLk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=YEC9dgYkhp95AAoiHu7QGV/JEhPk88+dKn1f91C6ask7PL/X7WTUUhP9uzOz3Eatp/Dhsi6GfswHKCzEdyb303hMfqDVH3V9A0eugsI56TDtZv+cOJXl7azdcMF49uS3hKeQRvorbxitsotyD9kcOvbsHPUb4UwnFEoa9FsikRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CA2OJnb7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CA2OJnb7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721062200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QvsspoSFQZNzh8zG7wAJP3rlkhjuyl646PR9f+N+03g=;
	b=CA2OJnb7m0tfeoTw/txKLeM/a6EGQpFEH5LhqrpuFWkH7AzwTD9vO0qMas2bs1AZur2+6i
	dy1bI7MATZzggDxNysJgUq3uwDc6hFZHpyfkaG5wpTYI/mYU483YkpEiDGN524p07Lo9oA
	KRcxIJ0yVa79APWd2i+cbyptd73Ehxs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-cmm82LDCMwKylydX3-CITw-1; Mon, 15 Jul 2024 12:49:58 -0400
X-MC-Unique: cmm82LDCMwKylydX3-CITw-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42490ae735dso42816975e9.0
        for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 09:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721062196; x=1721666996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvsspoSFQZNzh8zG7wAJP3rlkhjuyl646PR9f+N+03g=;
        b=nY+7WV0iCRi2Y0INH4wrtEvEGmIZ1BfFVuQrM4aEyRH4ksn6n60HaqBP+3kQqiubCj
         8HFNC+1BdG4dJel01asb2jbuJAnArke119JTTbK1I0Z0evTJKmLmXwO8asInyxY5O8Z/
         KQjdrkPh33xJ6UZqbHvnGAzQ/eH1q8Q3I9P2DEH8O5diOxQ5ikmntk36MbebyHTG2WSQ
         P/ib4fTarNp8av+eiO4mEYIiEoDdr6rKb0za7KZ/aGjUcS1M3pggkWLIAJLpvu/75f0P
         LePvynOUyIIDv2jqomXx5uzDRCvX9+Tp4PwAv9fd+mMca5hyCB7xBv1qslYKc8AkF9Mr
         LyQw==
X-Gm-Message-State: AOJu0YyWa8BuSloM0Psq40wILJ16UIcosdJFxQWgatWrp+0GgpPF3cOM
	HaHBbcwfHwph2OeTXh0oKLvbXYLNdkSkVvY/FiItD0R/RPQrV7CCK+qsh4xQi2SAGDPRqIU6WjA
	dC2hn5xhqbLRLi/im+Ga4RfIwlkTRrIZ91iCEIDY2zr4Fj9TNi8l1IqTHVjukOhikcmY8xtES+z
	hzw02dhrg8xcEic9FQ5nAuSw+/MOBkuDjkLmyH15Od4g==
X-Received: by 2002:a05:600c:3505:b0:425:81bd:e5ee with SMTP id 5b1f17b1804b1-427b8897fe5mr2021165e9.16.1721062196129;
        Mon, 15 Jul 2024 09:49:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDACXLtpwsXe+JV1CJm0YuaKr+E4EyOdoyHw2fVrMJXUg29+SxD8TR34wZV/Mp8uzLJUr3Pw==
X-Received: by 2002:a05:600c:3505:b0:425:81bd:e5ee with SMTP id 5b1f17b1804b1-427b8897fe5mr2020975e9.16.1721062195615;
        Mon, 15 Jul 2024 09:49:55 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:243:da88:7ff9:68fc:2f43:bcdf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dabf02csm6874246f8f.41.2024.07.15.09.49.54
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 09:49:55 -0700 (PDT)
Date: Mon, 15 Jul 2024 12:49:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH 7/9] virtio: replace xltabular with ltablex
Message-ID: <15b11ce5ac9bbe1aaa7818403b999ff39c74a479.1721062136.git.mst@redhat.com>
References: <1130700f4ae71a93d9887af35cf105731219f057.1721062136.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1130700f4ae71a93d9887af35cf105731219f057.1721062136.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

now that we only use tabularx, switch to ltablex to
make tabularx tables paginate properly.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 virtio.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/virtio.tex b/virtio.tex
index 3bb5c14..748df96 100644
--- a/virtio.tex
+++ b/virtio.tex
@@ -35,7 +35,7 @@
 \usepackage{xltxtra}
 \usepackage{etoolbox}
 \usepackage{tabularx}
-\usepackage{xltabular}
+\usepackage{ltablex}
 \usepackage{underscore}
 \usepackage{xstring}
 \usepackage{enumitem}
-- 
MST

