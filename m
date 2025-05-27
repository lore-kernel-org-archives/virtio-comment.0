Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE969382
	for <virtio-comment@lists.linux.dev>; Tue, 27 May 2025 22:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748386793; cv=none; b=fVrMm+aH/lDbbXCfH55y+ZBjx966JlgKhusGe2ATA+Mg4YktqgtR/B5gWh7ES+QhRSkm48qWDtqBeBTFDlOnYkPLUtjttNMHRO4a6fjwgm6ZqO2F8luB1LOz1GP5sPDQTDeB2RKONDPI+876YpB9joC5ODpaItUkycXBuYxUJOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748386793; c=relaxed/simple;
	bh=QGMzmWoXyjGwI13uefdAnmKOm+ChBTphsWc8aDQ+SWA=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=oyK+goofQH9Z4AIpkUZVqRQzo06MTQwx6ugeca1fKK9SMn5aMl5T1knnOqAeSuRqwuqIk0p8doizHVEDoEc2He6yPXOgmlfVYmcjywdeeonjKZdBCuiEm4ssOQLnIHLiD7APFxYjtkWXCRzyYnahp3Ma2uOdWyRT6Yf5LIrRJys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmOzvUKM; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmOzvUKM"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3dd81f9ce2eso1194935ab.1
        for <virtio-comment@lists.linux.dev>; Tue, 27 May 2025 15:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748386791; x=1748991591; darn=lists.linux.dev;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dSD+HmMNqXNjtLYby9BT0QTLqBMsLMM+P3Mmqiccde8=;
        b=jmOzvUKMA2nNy0WZbizzWiPAaEddAs1ZwX2IBpO75jKMnsqudkAuIYo67I08Y3ugYr
         8gdDlHEex0pi+oMjsiayzESb1prPGxDsSOxVfTqnJ3LvCRVhMhTyR70oQceQTRAeQ0u0
         S/zuKiv2MwlKmhTVx4732SO21SSqk7UQIkXBbidJfpasA4NpimQQlO6wXTVi//Maa542
         H+d5uIniIQ5hbpp6wPyXrSGhbT2MSMAAnU3dseBMVmIDJCTMHDKdxtRg+ndlsDpbdlJA
         AUe6kPGI/wx3BDm8am6+1CsJ3zjj7jGwBry98vuKO7XGda1jqW+7uTGSMYKeSIe/XQrR
         qrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748386791; x=1748991591;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSD+HmMNqXNjtLYby9BT0QTLqBMsLMM+P3Mmqiccde8=;
        b=Y0Yld4Xx6bWGZsMGFSx9duBP8JzzVzaClOjBRFyTc7FNoqC7CrgLphTzDr8kRO7Sme
         uYxVD03TVyLdhBH7CsIfJV3W0rVHKn+lGGtVJdtJamL6/pkGY4HVbbyGstqLpdDHHmvU
         uMfr/nfpVmtlukHgUPjLKR4jAM22ttNWGnN/aHEm7Qq6BGQ+FECKrni2a9IREsehINHQ
         exoxzqekpOG5V6M/szFswbDSHPn2wHdCGbDFTiPEzFL6s0/WNQdChsVyRTsfrlRXHBWS
         3qmIksrqjYLhJ32rsxn5VRyKEkXiZS8Ub3KkBi+tQSzjzhs9P7xMgQycyy3+2tmpAizc
         ssvQ==
X-Gm-Message-State: AOJu0YxYOXAk96knPJpMM8wp4x1u+Di27yqHxTbFpaABNn0I3zJYQvku
	GThTcBkW1VwdJwje0mZ3BLT5FjYHV7a7Ej3vmFIDSbURVpnmzG7GDXWZ9VPY9w==
X-Gm-Gg: ASbGncs2XIfMk4ryKbnQFZkZ4F0OLPiWGFBYSd0mCPXxqb48LIg1dIs8inAgPeoQX+V
	ztfvmPHbQzVG6fH7r7khw1xcE5EG55Hy7qB48HD9jtcCK0Rmq4+Mgt+IhWE+6YcuMNyDWauhjdW
	s8SdOFLfwtJTSErnwAXqNINgFNt9ow7E8ziMJL/y59NXDOnrM16pLFIKY4FWyl+7GVaoETPQGhI
	X8mzIAoZ0WHfLOvHLT13ml+Wb9Ci3xBuSflpX0LQGDk4xcGuFCbFGtndxj1rTMyZX2H1rA+Xuj5
	e919UogZDIrIyb9Vn5IX3Bp52QwUqkKblpS/c406RZK+5dUL/swfPUE=
X-Google-Smtp-Source: AGHT+IFrQ9TVFJ8nw7Vcpvpi5Fym7I9uJznimAEUjRtmOte9p6xX3cL7AB72mKBh1SYiN4sPD6wURw==
X-Received: by 2002:a05:6e02:250b:b0:3dc:7b12:b344 with SMTP id e9e14a558f8ab-3dd875ff824mr27753165ab.2.1748386790705;
        Tue, 27 May 2025 15:59:50 -0700 (PDT)
Received: from [10.138.10.6] ([45.134.140.51])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dd89bef0e1sm798305ab.48.2025.05.27.15.59.49
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 15:59:50 -0700 (PDT)
Message-ID: <08560f71-5fd1-45ba-932e-f3715d2d2c6a@gmail.com>
Date: Tue, 27 May 2025 18:59:48 -0400
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: virtio-comment@lists.linux.dev
From: Demi Marie Obenour <demiobenour@gmail.com>
Subject: TeX quotes not typeset correctly
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

TeX uses ` and ' for left and right single quotes,
and `` and '' for left and right double quotes.
" should be avoided.
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)

