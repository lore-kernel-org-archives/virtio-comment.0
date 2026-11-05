Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793899763;
	b=V4cwJcql4TWCQVDP9ilg1qKK+kZkJeVs8D/jMCUvH/OjVIE9JfLmCsZOIg2TKsPM6aPm
	 CbhRlv3UuYqZj0ZoCWC0iFYRfsUxYc66vLYGKgTmixFiAVLhjrJTwDIEVp7muwFK/rPLm
	 p+EEW4PkyaxKw+9LwP5SsnyY3Y20/NSPEb7/s+OhReAp/eSpyS8IB2Bo8WKfeOO7uXuTn
	 XF/MZnd1BC3GsO1NpRvgPkonKFdCFdLyRIbtdB2uiHbVyZOf2kYYOfA/PTjHB3RYqX1YT
	 a/15gxqXuIOs44aLsdiIj4Pav2r+mQKAtDe8Moqis+O5sCS7oP4/a3QlFcM4zfpjkxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793899763;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Ehb9dHE9yDH7BsyU0udGJ7O5vd6EoenheZrLqd6hIa8=;
	b=VOxbGja2ICFBISahPmfK/vzN5dpGZMeIhlXm6pCIeLLvAJ4VBhD7FKlgSMtD9uSPw54T
	 1bqeDukrsUt8q0WEGT6mNDbRpeg3i6QHLbNUX+4OaNFEkgkjqJVfrRmkgvJAyVEv9et6F
	 aKC3ckqbSaiz/TQw2gDjJUISOy9zCqMZN/+wR5B5JDsr8NtCtoNYjlMGPzlA0zzqzYFoV
	 6cPXYiUpXWzNJnLAL3/IxoxxlDlKe5sbI6oMKNwysSkoQrbWtYgNzOSzZD1nX7OsUhPh6
	 85qg0QlgyNjgQooTBBGkXWtNa0tgYOCRWNwl/bo/mcZMyEtuTk0Vr7KwRWxSUQLgJ/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Wsm1OwXW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.8
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011008.outbound.protection.outlook.com [40.93.194.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E67606A32C
	for <virtio-comment@lists.linux.dev>; Thu,  5 Nov 2026 17:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01E67606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Wsm1OwXW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uiXA38oECWnJRHsqb3/oD67dPXWrb742zDvOWPZwQepzrjefSaJUC+y+GQ3d3w/N/lz1nJlYioTbOMh2ihitA58YjtnApxYNinKIWZB58fVu1tzAIueensdMn/ybbQmqy0qDGDUltGrOzwqhRSa/qN7ZtsLMCr+9fwZarUtrns9r9IChf6FYmW11C5YhMUbikhHqXyt+z+ZyuHpqQ8bwYZHMNYXpiEFNHr8t5Z2uykREe39nvUx+lU6jBUWeRf9X/rgtOWLpZKhfYmmfYeZMsWzsE4c+i940nLjhN1RkjngHXhA9km3Ypz3Tn4tSkgV6Fc+wA0cVC9PAJ+m9usOXTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ehb9dHE9yDH7BsyU0udGJ7O5vd6EoenheZrLqd6hIa8=;
 b=PWWJgGHU6+S08vAao8q+IAcFOAd4GMeWBvzFLuBKCklVrfMahIHE1cNSNQhv9aSsTs9AnycrmWEhU0oVgrcfuDsmZQLQapQW7R6VjJ4qcT96xLCwwU/dssqD4AHYu+/JRrLb1WM9f4ocAq9UNWIQejZWgy7jjqD8gMndF6wA3W/ux22we4/oHDjXlTy2YSHlcOi7H+wSw/LViLIfcR4KHJ8fv00+c/usOzvM8pQGT9Q8vo48D/dEQP4m8h71bqzbU0p7jB1Tn/x4K+matAX5UOGKY0JVYmMRmPkPvyhWrqpXHhQhTy05wRnjb3UCNrh+bw85Yhd+ZHkSMFPaCI31FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ehb9dHE9yDH7BsyU0udGJ7O5vd6EoenheZrLqd6hIa8=;
 b=Wsm1OwXWAErgntHKL0LiUTOg4ODHEW47EIAsULKDkcW3ClqnNCb2nkPb/mbE7ur6E1oKOf1idCGk4264+vC53GWoVfC85xbZ7i/2kiLzuNuU6MCxYNjl1BZcN217/5roIMyiXrKUxCYWsF0H9oi/BNZOvM4TUk+BFtQA0Xz0Hl4=
Received: from MN0P222CA0017.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::22)
 by CH0PR12MB8508.namprd12.prod.outlook.com (2603:10b6:610:18c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 17:29:09 +0000
Received: from BL6PEPF0006C3DB.namprd02.prod.outlook.com
 (2603:10b6:208:531:cafe::6e) by MN0P222CA0017.outlook.office365.com
 (2603:10b6:208:531::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 17:29:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0006C3DB.mail.protection.outlook.com (10.167.249.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 17:29:09 +0000
Received: from AUSALIEM01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 11:29:08 -0600
From: Amanda Liem <Amanda.Liem@amd.com>
To: <mst@redhat.com>
CC: <virtio-comment@lists.linux.dev>, <mvaralar@redhat.com>,
	<parav@nvidia.com>, <nathaniel.mccallum@amd.com>
Subject: Re: [PATCH v3] virtio-net: Add VIRTIO_NET_F_LABEL for a per-instance label
Date: Thu, 5 Nov 2026 11:29:02 -0600
Message-ID: <20261105172902.11833-1-Amanda.Liem@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027132238-mutt-send-email-mst@kernel.org>
References: <20261027154836.13778-1-Amanda.Liem@amd.com> <20261027132238-mutt-send-email-mst@kernel.org>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0006C3DB:EE_|CH0PR12MB8508:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c517cc3-706c-4aec-ef01-08df3b624d07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|18002099003|22082099003|10067099003|5023799004|4143699003|11063799006|56012099006|261028144727099003|261021121427099003|261022105027099003|261021123027099003|261026121527099003|261102123227099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	yl0gxN7dfaMFztHIfinUDPMClJvUb+Zm/ZeamIEqhy4iwPYCT3UJ9GfbOyBgqDGVZGeM2HMPy8oTnoE2rul3hdLQdqwXaEfgifMRWt21HpzWdfFeDPqoy+VfX5OE09jo+s4gIEtwzQ+K2EznYm9KXG/QV7YYEwUxiYiIHo2un/Q3+lWpFPuXYmjUbclbE0rpcAXH/rsvrivxL18VI38gftKZF36tfhlWV4qLdfo9XgdVZxvH0ayyRUwGfNj2Ooa9bku/tl8wj2qXQCu3JTO9MCdlt08In9MguvKeM1zEHca+Nt/xdCsgEqBS/nmFE9Cq5/aFvpiCNr/De6T0W9vk8N88JhSmHAxV9HWmqVXLSL3zB47xaa6NcNxxmIqcxVYk0uNnauTz6eJEH0nlrxzl6n0b9RWG004wkS/tbZRGasSn9oQgcn9+SYdJYPxIVOIhxz0yOUZJdE8VSnxtHPSkFAm6tEfUFHplIsvxS6wA4KLyekuVQ1SLIh/J+Kvg4p6QPEAzGuToP5kiK72Y9AAnMBXN4wXkcVsn+eEP06evfrkfWTTfjvuxqywwzco+2o8bMsUEuCCmKBxv8vTaX5fpPXrhueQkpkp//pfmyjOhcM7nwPZ82XdYrJtlln26ob/gc6k2vIKEJaOokYDzF8vjhDlHtrLEd/rFlQMWtklz49n1DLa2J+/Iz20R91tXPOp4rjYRFLJXQk8kOsw3Fi7pkA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(10067099003)(5023799004)(4143699003)(11063799006)(56012099006)(261028144727099003)(261021121427099003)(261022105027099003)(261021123027099003)(261026121527099003)(261102123227099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4rIaZY8eo+odp1tIgt+tL7S6/yJMmwWfzwr8IEo15G2BP0twYoib8pNKPX0TEnIFzC4zqGK6hZ0OOrSJpYi6OfZp0+uECG7Gz2W/X+Vl07crirL5qh6FHUmvpMIQjFDRDnpiHkUNnmHussKg1TUc7wp5/ABr7+KHej9jJyeZUzaNhHR11nQqJsmmMIUgp5tGbHzYzvpSJw8cChWbxoXlBjrFpDjGAmNRYtL1ktGz5Af5cFLGa1ibB50vXnFawXvCODV1yM0bctvUDcbRJTdvMf2zy+BvRGyZEhtVgBfBr44I+as9aKUysmJ4KOUvjD0Fb93CNDBy+E9q90pcIv3JBPlN2KfJsTQ2Pr0k+T+BwljAy1VgBIEwZJuiWwQHBjz+0Zo2kJpDKuEs4WtsZM6CPPqGR9Y2yYfVLmeuiUQQnhHoHPFEWTIWnbdVpR2HWZw9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 17:29:09.4646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c517cc3-706c-4aec-ef01-08df3b624d07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0006C3DB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8508

On Tue, Oct 27, 2026, Michael S. Tsirkin <mst@redhat.com> wrote:
> This is not what the text below accomplishes though. It talks of
> human-readable label, and says that it does not need to be unique.

Good point - the v3 wording doesn't capture that, and I'll fix it in v4.
The label names an out-of-band contract the guest expects and identifies
it for lookup. It doesn't need to be unique because it names the contract,
not the device - one or several devices may carry the same label. Its
meaning is defined outside this specification.

> You didn't explain what the purpose is, then. The host can swap
> network devices, why is that not a problem at all?

The purpose is to let the guest find which device fulfills a contract it
expects. A guest serving HTTPS, for instance, needs the device that
receives port 443 from the internet, which the guest cannot discover on
its own, so the label points it there.

The label conveys no trust. The device asserts that it conforms to the
contract the label names. Whether it does is the contract's concern, under
the contract's own threat model, and is out of scope here. A lying or
swapped device gains nothing it does not already have - it can deny
service, which it always can, but it cannot make the guest trust a device
the contract would reject.

In the next version I will also fix:
  - drop the acknowledgements.tex change
  - remove "host" from text
  - fix the layout so the field after the label stays 64-bit aligned
  - move the MAYs into conformance clauses
  - clarify the comparison text - a device presents one label, and the spec
    does not require labels to be unique
  - remove the security note

Thanks for the detailed review.

Amanda
