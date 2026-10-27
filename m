Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793116125;
	b=2EH/1KCHa6vMuUsLG9QLVffRzv6ps0/FphJSIAClzRUrxgA0jZyQ/Ii0AKvOZK13cHvk
	 oW21/1ucfHsh8pDyPyMU30n3n/HYYnr9FEMyPtasHDiZ8FUuT+HmRWtglbj8D9gaCmHAI
	 jRmWi4ge6QGksu3uBhCYZulf0MSQOlJRYBu6P0X0/z8v202j9mPiGPWZ2u+6sd5a4469w
	 N4k4nG8fecoGPN3KeyWM03y+U97wYBmbxplkgTf9BGDWIC/RwUeVLWf0p0OAeYyrBqlyy
	 u9viOUAC0oRnkzuEc78IHOJjXI5ldh7Roza6FdZCsl47RXVOTVP8Doja48qNoKnevQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116125;
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
	bh=bj0jvNL9ScTEQHSgu30y3DLDjMkQ/iRUuIbMqI3ezjA=;
	b=EKNwb6f4hg8IoZS3Vwj0Gjj7ofVpLr/swt2fsfA/RYNswyy9fdeTzYZBx9HSRngs/Jsj
	 AoBy0zhOHssrnMxKF01G+Il0CM164i6AZiycqdqnVRAuplV5vF0u0+8PM3DS2/dyAi90j
	 HJUYhixe5Yb99FqmAxAjvrPk686WC3f6/49Pr4sPQoFiu7njBZdxt8RWj6wYrbsJ8EYTW
	 31toMc9oMUgdySuO0ooDGrKYD20qQcWixOZFrZpxxT4AgVaTGwnf1jsCi5lV3mvz4Y/Lb
	 U2j9dLzPqdzMe+0YmDM+BjOdscUDW2SbKZwDW4sRSm76RLlT1GKgRyVGzreJfjmlBmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VTyIDZog;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.65
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012065.outbound.protection.outlook.com [52.101.53.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27B7606A31E
	for <virtio-comment@lists.linux.dev>; Tue, 27 Oct 2026 15:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B27B7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VTyIDZog
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/OslMt+oEklaUl6vt5YlpY3ZdlszDHCbYNze9DWBNWhEjmMSgChEGTnot0dLcuOMA14/tF/2k1qEbx62J7hXdnmKIa/wWU+wctfLj7xQkbzrKQnmJ+lK8QZS/jBT1o9gIAjissqCFH1qGY9z7WWWmiQWMZdRcj14R+ev/9O0d/YwO7fEs+S6jBIoUJYkcTSuu0gGbPIkeMhU24OFJq4dzsZZYBt0o4+mFFjeZr4w7D/s02dj/HGuykpehucn0huyUCibKRBF2mYdFWxijpe6ZUrxSK7cuQJFkVetHriQMJ1USHQtUQhH3vutgizk1NnAKVJ91u+HFRBIMaZuU9UMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bj0jvNL9ScTEQHSgu30y3DLDjMkQ/iRUuIbMqI3ezjA=;
 b=fH9egpy8MY1dPk7Pa43yeCvG3DryZaiYxJVh7QpfWq0N6b4XSSb2FECFjEhzhX7UUHMEDe+xJ9DsX2fobjmgUb9CH2zSv+E/TzDmL+iHJNpSIA0Kspoe44GJdr9MFzaichPq0Trrdmd9LlxrN9Uv8d6g5GFnx1rYBvZ3J3KSdQ4gEKSDgymBrqyRzSmM5pq3qsmhFhyvuOdvjd48GN3kh20AMMOzFNvoblNS63nV81W81QrXe9S4J/mG4rXoFuv3WYIzg5VsW4XCTjqxfJScecq/+RaLAjYQ074hLl2evn0RFji/SeVBMrDfAKW+KHooak/2KnfI9gVZkqGKcjBoQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bj0jvNL9ScTEQHSgu30y3DLDjMkQ/iRUuIbMqI3ezjA=;
 b=VTyIDZogrkv95N42rAWIvfVw4tq66r+G3F6H6FioSakGZhBdFsxr14rDzFsEegcJvYirJdFRXZGQu9nAoJe47pHGKQdkZ5o01v+jgE39WUI+gKqFMPgPWC1XxNXPJ8hO0tsyR5lbUnBQVuqjD0Ujf8oSGre81/TdLI4p3pjlz/g=
Received: from CYZPR14CA0042.namprd14.prod.outlook.com (2603:10b6:930:a0::18)
 by SA1PR12MB6845.namprd12.prod.outlook.com (2603:10b6:806:25c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 15:48:35 +0000
Received: from DM3PEPF000265B4.namprd02.prod.outlook.com
 (2603:10b6:930:a0:cafe::5a) by CYZPR14CA0042.outlook.office365.com
 (2603:10b6:930:a0::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue,
 27 Oct 2026 15:48:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM3PEPF000265B4.mail.protection.outlook.com (10.167.23.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 15:48:33 +0000
Received: from AUSALIEM01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 27 Oct
 2026 10:48:30 -0500
From: Amanda Liem <Amanda.Liem@amd.com>
To: <virtio-comment@lists.linux.dev>
CC: <mvaralar@redhat.com>, <parav@nvidia.com>, <Nathaniel.McCallum@amd.com>,
	Amanda Liem <Amanda.Liem@amd.com>
Subject: Re: [PATCH v2] virtio-net: Add VIRTIO_NET_F_LABEL for a per-instance label
Date: Tue, 27 Oct 2026 10:48:14 -0500
Message-ID: <20261027154814.13762-1-Amanda.Liem@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ar_rFCrex3b9Nz6O@mvaralar-thinkpadx1carbongen13.rmtfr.csb>
References: <20260924153024.3362-1-Amanda.Liem@amd.com> <ar_rFCrex3b9Nz6O@mvaralar-thinkpadx1carbongen13.rmtfr.csb>
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
X-MS-TrafficTypeDiagnostic: DM3PEPF000265B4:EE_|SA1PR12MB6845:EE_
X-MS-Office365-Filtering-Correlation-Id: f5d245fc-6906-4359-6c26-08df3441c188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|6133799003|10067099003|22082099003|261026121527099003|18002099003|56012099006|4143699003|11063799006|261022115727099003|261021121427099003|261022075727099003|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	sFRc3H2XQRswUs3fDCwJ2DLhFP4LDst6+WyLweNgEADiUTzrDLZ7MLTkIy5KdKSnQDRplmO3uXOz97QKt7MrzU5I7EEhJi4vMJu9e7/vtB4PnzXDqvvtunqzjfKlcdHGyWs1gkuaI/A9C2qKB0XJ7jcTkLg+I4K74/MKN2tYQhXukrPUtiqXr/E8YoO1vVH14xOku6Q7Va/H6VLAp+u+qO8UF2+iSPK5BpD2js+kYuaOFf1M1wquP8L5/OwOtIkpWZRRs2bu7/iINUUKGBDVC44iEkHerRAw2xVH9RYa5Py/ImY6CZuscw/2VJihjZxzlOLxPEPE31Z5bwF/OUsjA0D11HT46/XcfH7riHF212Bb1LrGOMg4OsII4moPQ9HfsBK1upeyir6FhkMwtfDRaeUjUbT+W4bNwAoYn4Oq8QbgDcLv31+qBTf79YLZstUzTYylMJMGBXQ5IaYuQmKhvmMWgG43wx5x8iXcVQhNhw13vxIfalF4LkEbHjY62TlLjmZViXKCnbOkM+S/x64sHN/z29f7FybQyRlwPWTd9ltxepWBgARo7gLLs6VoOe3pGE+LJk78TPZV4XyszdiDfrRaOVzkwQ2kXffkBjtp5KLcjWQEcjVJctBUTAvGt7Cn92PvIaWCvxmeFagTAvj2+OvBwwNzw5dlJNpcSsrAnN36KI9xQTLq7WQx5i68N0VY5r0W1p5AM8Fhrb2Wiv+xSw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(6133799003)(10067099003)(22082099003)(261026121527099003)(18002099003)(56012099006)(4143699003)(11063799006)(261022115727099003)(261021121427099003)(261022075727099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xG+KUR3kL4mqcrtu8CYcUdIPm1VxYjZJZDE5Q0PQOHKGltxfqpf+SC4xcDVNtQQS9AEg4lpz+mIRgP1WI92QwMnpAZ1rKuJG/hvbTU8z1HZKfH1TM6pFezk6j2oWMyZFYJkS/Qmr966MzA1ceAOE4Vasbxj6ykcBScHFsBFQEz+hHbPzwOBekAoA6M0jKvU19dYYjMRzFa38uKXNkWq3sW/6ffTHpo0D2l13X83exEK/YicUXWTLTC+NDsz3+uZuwjm4cdlyikc7oub196an5KECIdG4IFhGG1DFiLUSVqUfQnqCQ4okAJsvM6v/wHDcyWRf9TUugnftYYJeLOKpQtbp2U6Wfo+/Z4bhSfGQI4dcY083ozb8xDho4UaQbzGPRAWxI29IHUxo+Fv8JJlMo6vpqc1frni7AnzNJn3J3lK1iG7FhnqM29+jRnRKfI48
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 15:48:33.3564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5d245fc-6906-4359-6c26-08df3441c188
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265B4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6845

On Thu, Oct 02, 2026 at 17:34, Matias Ezequiel Vara Larsen <mvaralar@redhat.com> wrote:
> The manifest will tell the guest what are the expected virtio-nets that
> the host shall expose?

Yes. The manifest is guest-side input, shipped in the trusted image, that
lists the expected interfaces and their intended configuration. The host
builds devices to match, and the guest uses each device's label as the key
to map a discovered device back to its manifest entry. The manifest format
is out of scope for virtio - the spec defines only the label field, and the
manifest is one example consumer of it.

> Does it make sense to allow length to be zero?

I don't think it does. VIRTIO_NET_F_LABEL is negotiated per device, so a
device with no label to present simply does not offer the feature rather
than offering an empty one - an empty value carries no information and
cannot match any expected name. v3 requires label_len to be between 1 and
VIRTIO_NET_LABEL_MAX.

> What is the state of the device if label_len is bigger than
> VIRTIO_NET_LABEL_MAX? How this error shall be handled?

A compliant device always sets label_len <= VIRTIO_NET_LABEL_MAX, so the
device side carries no new requirement here - the over-length case only
arises with a non-compliant device, and the handling is entirely
driver-side defensive. v3 makes that explicit: the driver MUST NOT read
label beyond VIRTIO_NET_LABEL_MAX octets (no out-of-bounds read), MUST NOT
use the value, and SHOULD set the FAILED device status bit - the usual way
a driver signals it has given up on a device.

I used SHOULD rather than MUST for FAILED on purpose, since the label is
descriptive only: a driver that would rather treat the field as absent and
keep the device running can reasonably do so. If you think ignoring the
field is the better default I am happy to weaken it to that. FAILED seemed
the safer baseline given that the field is attacker-controlled on an
untrusted host.

I'll send a v3 with both the zero-length and over-length changes.

Thanks,
Amanda
