Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381552BB04
	for <virtio-comment@lists.linux.dev>; Wed, 11 Jun 2025 14:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749653511; cv=none; b=RiegPv96ldbS9qXAgh+arKu5vOAJU/eE2XnSL4doqNYyr4hF6/ZkL2NmGoEHjm84bBosZ+La7URZqlOEyMSL6EDy9Drm5pvD0KzTJeLmBoNkO/vPz1r8F0WymTaScIR0jsJycl+AUcrjhnyYWiYMi7UVkZL1rBPrr4CR5Vb8e+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749653511; c=relaxed/simple;
	bh=c7BoTiN1oKzHXblwYX+Y/6CUxge231NlkdSeRu8w+CU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wvma+w0IkuGDKPtOVWxPFxXrxZ4edR8vi8YedW5NNsqIJrTMkUly/VThfEGmxVdUHXvoJYlMETKZqF9TgWbqM/zUZHh48AQU8wjjTwuwwJRMG8iuKjMApgUPqPXIs0w+Xu1cnGBZL0UWyVjaPoulmf+EsJF0Q9GOBoM6IhgcbVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OWsVI23S; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OWsVI23S"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-234c5b57557so64579845ad.3
        for <virtio-comment@lists.linux.dev>; Wed, 11 Jun 2025 07:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749653509; x=1750258309; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7BoTiN1oKzHXblwYX+Y/6CUxge231NlkdSeRu8w+CU=;
        b=OWsVI23SttqCaY7JU4oIt30syiD08ZFmO98jceb7a2sRlD8bey0zdQ6SNmSp7b0xrb
         S9vg+X1cChHT5rE/iq1fBvAOPhUH9wE/lnQSlIE1vkVc+gsbEm3usXZSshazBdCd1MUp
         04NJEnsOnpH+O3FIbKEyrNCW6RH+po2vHclY/yoQYAziDKxV7iJYgxdtGN/+8rROKY1Q
         3PayhKWqSOIN2J6PTCPLFe9HjH3/9hXNAMZrq60K/ZzUfY/kkq/bqJHZxhxR3RmEBTrH
         fwV8ml/cxF0ky6wiziBI1PIxriasqgukiVKfnRHwUUSjbmpp3n0eto5rWCVz8WmcyBjR
         2iQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749653509; x=1750258309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7BoTiN1oKzHXblwYX+Y/6CUxge231NlkdSeRu8w+CU=;
        b=RvxYiXgizjayWwyNH7y5lDYWnyL6NkgJcQshot0pYNgFCvKQT9ismcbmi5Y2UG0MUk
         tffi3Cw5Gqpjb5W20AhA69NwlTNatPNFv95ZN9VVDo4pz/u2jbk9w/y9yoMTv2wjjnTR
         rVQqEYlp9i+emIg74kzbi5z+eAnDp38P2/ZpwPFuBs5Qex7R5VLOR3FkPC/ojsZ87D6d
         58MMF4cryjnVckKUbzqrJWrrKe1rxw/kDR6jcpAM7lc7FHy8VjAxJLs24e+qtvXd1lYB
         JkwjeW0X1OdSaoPxkzaTDeUZUGsv/UIocML4Yd62v2MfdklggcViV+V8cbop0L5QfDP/
         zlGA==
X-Forwarded-Encrypted: i=1; AJvYcCX6qxDkrzjQMMVSa3K67e3/HB30pEGnQ1cqMMseqYLxQykn0l4qFXgZ4pM3z6mNWW0QCb7tgZDRuIL9Z+rE4A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNJeCl/na7yRddE2umg5ISraI35S7epWUUkIpacTSOVV0JaYAK
	jxTaf3MlRVKHZohSkc963F+aQgTRS43Yw6ws0oP6k55P1RZCVktUsgef
X-Gm-Gg: ASbGncutx1IpuXCWL0BVTwpb3BSwyGwdvokJxSy2+/lmnzNVpHaYc3fEalQU4BE63dU
	or2NR0xahMwvakLfbJuJ9cTG8V6qTa7Fi8aDxZDbla+HbV1QPNQweCrd0T5g+yupMDIeevjCgBq
	4HWrpoQAqCD8o62ZVdNij20CaozwWGBwG8XPXvQ2byxxeXWelYLZxICbOTkvIBLaCsnvUNZH6Na
	AoQDRzTXpNA/wN58SFZ6Jv2MZE3ffDKTI+Rf9y6zMfvAix5+AqU09xB3wrt1MRae28KA1/n6awk
	Tx71NEPsvgKB6XuWKWqBkZN8AU1CSjKTbfR4VGDPTENqGrltkqOklYyfF6eIsFDI9BFLYgI5/fF
	zUh1Hqkfd
X-Google-Smtp-Source: AGHT+IFpPl0Kkl7f2fSxGvBP49QYDti9PA0lbIPxGpKxYaNrz5JW9BtwNtVAl0rcBY8RSiphNBc0EA==
X-Received: by 2002:a17:902:fc50:b0:235:f143:9b16 with SMTP id d9443c01a7336-236426a8434mr47398115ad.41.1749653509380;
        Wed, 11 Jun 2025 07:51:49 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2360340b735sm88639015ad.190.2025.06.11.07.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 07:51:48 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: niuxuewei97@gmail.com
Cc: fupan.lfp@antgroup.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	parav@nvidia.com,
	sgarzare@redhat.com,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
Date: Wed, 11 Jun 2025 22:51:36 +0800
Message-Id: <20250611145136.869465-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519093736.3076953-1-niuxuewei.nxw@antgroup.com>
References: <20250519093736.3076953-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, Michael and Stefano,

No comments since last month. Does this patch look good to you?

Thanks,
Xuewei
