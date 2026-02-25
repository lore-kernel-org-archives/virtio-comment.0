Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012003.outbound.protection.outlook.com [52.101.66.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F144A2AD2B
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 12:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.3
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772023634; cv=fail; b=d60MTJ+y9BPv5OjRRStLddC7ioyNvFVZECi7eh1xURc94Ya0qz8eDDZthS12+EZXhUYeCY1/Cb00Jfd9/6s/0/mCZQworzrpcchidKJTUi2FPhYCBX19fkhf7jCfcD7zUyO+NYu3l2zp8OxF5KZ1jMkCiQwfjIC0a2h1seyYOqA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772023634; c=relaxed/simple;
	bh=qmqN/1xUv7XcAs0YsQySnUwkz44ysSrqSRY2qmww8cg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dvqZTi9k42Ns12ZBhCH8WmDNRV26ZJt0LEaMM6YzG9qACZnoIxYhTLZve1W6KGJyNhZ1XScGuVQPUPxdo4ouE/CLZCe/dC9JWv2wrrc+fCQDFJLpPzHs6QLVVWbK/B32sds+NLo3alThdFh2OF0yiRjmA6dpLN4tkmrFBYkgEAs=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NALKMN+o; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NALKMN+o; arc=fail smtp.client-ip=52.101.66.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NALKMN+o";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NALKMN+o"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=B9ZnH32EljiBwkgPsDBw2p7L8A0UnN2CkT+pDuh3Plsm3kkaS/789ZWt/quAGN3lLzcfH4ekjrSpe9fxDsfPtlEusvtIcXkkcv3eIv9tXg4XdnfNni9nkMWNxmB4hLaX1O7c8/BdVV4tf1niiFiswDG1/O8yuyl15UIwAqKIc0y4KjJI1tWvpljoKNsWW4sYpUGfjn6kg/gAEJLzFD1Qkx9TINYoL2iUlwL5Vq0ksc+or2rxWXkHCGgGdxwqTpzFu9J1klsrdrkyCtViHpzxk+oOtwuwL4LxvgpVV/0aukfMWLTc5tNen/gyFYJSX/EtbJg9UUpUFf0W006DhNwcLA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CIwmrnOVxHZXFMyZQOPzeFZD09KJ5T2CC5wGydiXGE=;
 b=j/a7Yc6C0jRPp3WkxBjlG4SX60WvqFIM4GXWfXZ9aL1vHaUBBd8K9MS7JQKOdm4RNIA7wjPcUyx/w2nQWf/48c+PgU27fFTiqQ1vnv+AUcDpfEp9I4k+8MM0kWcK3YNDvF3CRJ4lGHwxFPieE7gq1WoBNsMuDXcwoCZCLs23CcFTMKcHW8UPnrz5qaF0z23+mHjsu999t3jhgw0h+ZqP4fNFeAnb7JPPz4uiZ4TQJ72eFKYT9ohLIGeKzFg7T6Bcu7xiAUzAmGf/Ahsl1Sec7R95BMqCvcgcAUJeygRAPttzyNUHA2A6uNA8ctdn+kKZbNHD3txC7nZNH83jOfZo+Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CIwmrnOVxHZXFMyZQOPzeFZD09KJ5T2CC5wGydiXGE=;
 b=NALKMN+ohQd379uCwZISo+66uw+eHp5LIAlaCloeRWIM79sSyIamwgt/0quYvzzAGDXm7RqlG//LWZv0eFXF+Efs3exeI1VPNHb0WG6N50ij+S1lx+xGyWySrOv2y91zXdU5Eu16s6i8tCPqglBIFRM3aGCSkBvFG7TQv25P+rQ=
Received: from AM5PR0101CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::40) by AS8PR08MB7353.eurprd08.prod.outlook.com
 (2603:10a6:20b:444::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 12:47:05 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:206:16:cafe::f1) by AM5PR0101CA0027.outlook.office365.com
 (2603:10a6:206:16::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 12:47:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Wed, 25 Feb 2026 12:47:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dU+06HjBNJPpWG3673kdYCeGpDoEcSegAkjPE4T691gqieoZCrsxxjg0uo1trjRGZ3WYlylSrz6WEnvT7uoM4JTrcrwWUHrio48RXpo+WabTD6mJ3YPQK8pIKLfP6IT9j4FHATYIvkH+z+DQDPWYd+dIGV9lLBD2krVcWV52HgkPxRMzWoAO6iipHYKUMnED6XtNfRUWQ+aczjkbz9zArttxK4A5KHWwSZV+6Ng5H5qYz7xRQsBrPuAC58GHHRrGqb/Y+nzYi8D6k79hf9doK0jPdBoX6b02sDvkiy1BkHcAb/3lg3xfGvkpUPJyrBgAintqVUMvEZPku7u8nhLxZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CIwmrnOVxHZXFMyZQOPzeFZD09KJ5T2CC5wGydiXGE=;
 b=Em8jsN3cOQLKqdM4gcwz70BmcTFccl+VbQ8QKp3lvvecyOPLyReJVCcZWFhPVhimMEZg4kfn6Q4NOmvVNU4eItuImy5OJz33EWX/us6Xvqk3x8NtdBHy5KnUTKV1kaP9tySNjbD/2ci/2xyyLE+I1Lq+s9goSd65gF4r2pnBNgB8IdGLpLNDthbG5xjgZZKZ/CjjwI9SOeQbf9pq7C3YoDYTarn5hYFlta0eOX96E/0h9YX9VPCYDnlIzkqObZPuIXfPGn9xp/soVJ2qkEjcsrAStw2w2ju+d1bQJ/9+n9iIzbpGVWQgD7tZYUmjbNSjBeXeFoqppYeejZ0JGNMSFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CIwmrnOVxHZXFMyZQOPzeFZD09KJ5T2CC5wGydiXGE=;
 b=NALKMN+ohQd379uCwZISo+66uw+eHp5LIAlaCloeRWIM79sSyIamwgt/0quYvzzAGDXm7RqlG//LWZv0eFXF+Efs3exeI1VPNHb0WG6N50ij+S1lx+xGyWySrOv2y91zXdU5Eu16s6i8tCPqglBIFRM3aGCSkBvFG7TQv25P+rQ=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DU5PR08MB10678.eurprd08.prod.outlook.com (2603:10a6:10:528::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 12:46:01 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 12:46:01 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
CC: "Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Edgar E .
 Iglesias" <edgar.iglesias@amd.com>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, Alex
 Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 2/4] virtio-msg: Add virtio-msg, a message based virtio
 transport layer
Thread-Topic: [PATCH v1 2/4] virtio-msg: Add virtio-msg, a message based
 virtio transport layer
Thread-Index: AQHcjuFmIzYveS1Rqkq8YyoL1D1kt7WTiRcAgAACfoA=
Date: Wed, 25 Feb 2026 12:46:01 +0000
Message-ID: <51E37AEC-60CA-4B36-8679-970C799F51ED@arm.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <20260126163230.1122685-3-bill.mills@linaro.org>
 <1ae53f34-b40a-45f5-bebe-102908a81d13@gmail.com>
In-Reply-To: <1ae53f34-b40a-45f5-bebe-102908a81d13@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DU5PR08MB10678:EE_|AMS0EPF0000019F:EE_|AS8PR08MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: 6018ba40-e655-4556-1842-08de746bfad3
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 MvOgjScclrhCzhUhcYw2b8sWs0Zh15kbmN6g5mOiSxk63QJ628bO0QpB6xnXLFwVnCn8mwlUhN3Jwr8+BedYUJwjuOoH5sh0zUCeS4j0Tv8m6laJNd4imnoBynAA2mhcI0TSVDjuF/4854BpwQDUVa54ScgKImXU14IxJZlLa9OTcF12cEtY+sWAnK3L3RyYdx48Q1lOcGN7nj/gl41A5gCyGAPOXlBjD6fba6orYLzGj0WexJJlkUN4PzOAGJRBg0J5heynVy/OgtDavUH0oWqFoTHHOyoph6ac5wsWxyXJPjneaW8SDuHzX5VjFZ2YU0sO6tb4MlxkmI5ZG5psROqUFmN6pz026xxixo53ovjQhuLMU8nuomZDali31dtj3Fmb/fFR/2+/NyRLNPxjifnlebI1plxiLvThkuIO+NnyJuGPZSZM6fon6DF0V7gDhj6P5W/TE73fa5Ugy6V3lj67CyrUVE38kH98Guu2VXRdO3x4heaUeNI6T4gqDMI7qO8NJmqi1KebQKqcAssaJ5taTR5te4oOp8Q3MsI3X3RTLANCFHvGqlNUivLv3H7v4vq5i3HakSpuBUyh7YGiCL0FThc3cVwxYiQVWbEmlILdu9JJcOFwiHAtfiSCLrjAfU2FBU3nlwUnxIFPWRzRnjZ+1T+9L3TO2Zxn8hMuBC19GWtt6qWwUaxZTakXKY0SygnwXQmp5kYKVjU25DTHFl8Og3UkL5Mby6v5A27/6BYOOo5qi1vKvdiPzKPyI9Fr8r9SA8qbhkFjd0Cz+aYT1gdcBlqT4Zd67pDILiYO7LA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E836842124F7DC4391FE68954BDE1699@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10678
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9000c933-ee4c-49ed-7849-08de746bd4ec
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|35042699022|14060799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	v5Wc1szalwqasDBxKBeB1epWWDQJ7RPgpjamVpe29Po9kb9X8AMXkaiMV0/WkuTftHMoUNt6LPV3Yj+t/oNDS7I37D1fznTr5KkxWC1Ok6BjyRyFsOBXQwF7ajdhPY5H6mNh0sR0tUy5uwrSMov8JFQ90JYDtuN+k1cwM3Pt0NWk1x4jH9CL+gDNBIEQ8FMcB3h6j0TsohLiyK4bLoKPsKM8ztYk4OIv1yWw8AuWAzIoL9H6PFK97I34+DyalZewoF/BDGF3MyxRiXh4jZhJQCCU4QNp11IsoLYAS+Pmikkb1mG2aYbDKcoAlZn51irFg8rN5pVE5KSMpDHc9FhUNP9V7Vwr7vLM/gmS2dFDxQ3CS8PQih0E+MP2WM5X9YNX+lUgjDhH0WC7wyR8J/OLimAiDcR2xR1rGWnreguQAVBrHCUlYPvVo3v80wuZzQ7kWtbIQ863ZQ8ZuxSbVkkXJHzUt2htVyYMclFP2AfwkrGiyeKB94AwFKrPNZ6BjUgMT+znxuuUKIOXlw92f9CND/to5qKASTARy6hpZHbdHdqvMP6rAhyWtKq8Jx3HSXZ+p1Y7SxV4C38HMgeObm/htxulTolQviaUPn4ts1Ma6ZDqdp0yrxgGWQ8kkyR4FTay7MEnMOLzRk1rtMrwsHAtgV2mOB0tjT5VABE/MPj1eKYD8kcNWyvPQI39ZcWgXmnaVt3xFL2RnCDCtZlhC7zgsKgMCYvNRw9+Q8DTT6LzPEBCXwNtlhHanlSfsj+fWcmDPQK4hG8bgvGNEb8ISchVzIiYqDnH6I3jHdewvV1d31xWz7Lol4MXuezeWye8eNxFO1Yp8ktgBvt2L/9ht85PHQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(35042699022)(14060799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WroEXevTLhGSl9pGyUasmCYSHHa9TWSVUumyrJ7Cd7G28y0D83iq0/IgOQ5zpP5ntBiG7GXhdoWkC0teGA7XXYWN6xSPhoJBBtsrUgV1qvUO7y27wJgaS2h37sKa58iDlEw+2TcsGPjnWEKo/hdoHCFuu+htyD9lnr9k9AgvAEdt6nPdAIiaslRILOS1OAQFEXibKA/Cr9T12noLbOwhO9UGzcHT7CHCse73EydyypdE/6Kr2/uwro9F1+wu83YOl4WkyOQOscLMYXtaP5zFU4z46uzu8/STe9Hb20717qetdGvubi+U05WC/vmCrYwDd2DubY9+qffZiMlYTOUiz7dFWhQbPC7BmKUm30uIrR5X1RRFih6NYrJR9e2peMpzChUbAnlmO4Lbt9TLZ6UgPGPUVY3V5kawCvCOg/nqhBw90wcDpZjqKH7TlyNfCLr2
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 12:47:05.0683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6018ba40-e655-4556-1842-08de746bfad3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7353

Hi Demi,

> On 25 Feb 2026, at 13:36, Demi Marie Obenour <demiobenour@gmail.com> wrot=
e:
>
> On 1/26/26 11:32, Bill Mills wrote:
>
> (snip)
>
>> +\msgdef{GET_SHM}
>> +
>> +\msgref{GET_SHM} returns the location and size of a device-owned shared=
 memory
>> +region. The request carries the region index; the response echoes the i=
ndex and
>> +provides the base address and length. A length of zero indicates that t=
he
>> +specified region does not exist.
>> +
>> +\begin{lstlisting}
>> +struct virtio_msg_get_shm_req {
>> +        le32 index; /* shared memory region index */
>> +};
>> +
>> +struct virtio_msg_get_shm_resp {
>> +        le32 index;  /* echoed index */
>> +        le32 length; /* region length (0 if nonexistent) */
>> +        le32 address;/* region address */
>> +};
>> +\end{lstlisting}
>
> Why only le32?  Some shared memory regions, such as mapped GPU buffers,
> can be much larger than 2^32 bytes.

Very right, i will update this to hold 64bit addresses and length.

Cheers
Bertrand

> --
> Sincerely,
> Demi Marie Obenour (she/her/hers)<OpenPGP_0xB288B55FFF9C22C1.asc>


IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
