Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7839E2E3394
	for <virtio-comment@lists.linux.dev>; Wed,  2 Apr 2025 10:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743591553; cv=fail; b=E5b9+XzrRliax1sYUc2gtKyaZB6WRyxYePigm84GZu+aTd51+JNBZNVILSYyUyIzlTeXKL3Pt6Y/pHSonSYEjxKw7dhdBjcHnZ5zPAHNiD1hn97Jq7/baVkMANljzBPxfWOBxtswpr7U+liEK0Q2+yQtNXmKyluuV7fXe1D9fHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743591553; c=relaxed/simple;
	bh=fVF/PvAbjKy4MslgR5PGvmPpeINKazXnB1G7v28x0G0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XqkpVC8u+/iKicghpnpfBKqy3xYUlB9C+MMbjoC4mgwWexW/7x0bJHTnNXRNh3YcMiSLQ4wvETxTCPZnZEq3/VOOKxyW5dDC6UyuZchNXAKQDtsyfyMeWAWVhOig4NRozTl0npXgD4aVuq2QJuv1iFLno1hUS4FmPPFPmC5XQ1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ofUFhsPI; arc=fail smtp.client-ip=40.107.93.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ofUFhsPI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHYzBfw5qZpBz7g6h2RzkgEOZL2vsaiv04bLVB84RP/BcpYvfvkSkkQcKpVqQmsmQUU1HqvCqXtKlUdyL+Kqj87CuDUb9UAoR4a1RYPPawx5epvMbuh3PVMbJC4hClSnnft8eBYGTJy8ed6aK3gleaD2gm3h5uqQumaQ/PaF27SIauEd4ePu4wFZtXNp7YSZlUR4kXP8WraqMvinKJInLmLUwj4o3x3E8oItHZwoZApoErfbXXC5LxxeAi0FRfiDrkgnL5lNg2bIRvjMvMu+HTYl7r3hWPrEzGCPIZcA5BhH44j5sal0rKZrYgjWE7rGR4SUXCPLRV8/hehg7UdUOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVF/PvAbjKy4MslgR5PGvmPpeINKazXnB1G7v28x0G0=;
 b=floDq28aYg6kcTSOsDshFyPZ9QSlC63NqRUEJxWz1krcF1D1ODjQCnB/lbgayuqEDzLnYXsAUtTzQDnOrcy3fIv+OiyxaXL8uYcfZ/adFj3mn6QjwI9Jm0ZuNxTLVi8bDG+YtFFJw2AD2XpEHRS+xEM+3cnr8gDIKIEUFW72EBkvTnDGeJZ9awko2rDrN3ytGl8FXbkGtbmmF/x+l99App6B/UKUMaLrMtHiQFUdCkxDowIgD89zb0kL2JLyS/PrKXDkLMro/2xSROTHy9D9m5VEvHzWI5VsG8Dm5y/x2pcAjyZzRh8iUmAKJKbzYU2MnUFnnTdav6DJ2kEbubLIWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVF/PvAbjKy4MslgR5PGvmPpeINKazXnB1G7v28x0G0=;
 b=ofUFhsPIZfx3wpTgZC99vDOzlEdDPoIs0YuP7cEkwPsw4Bk8gieHiEFHvb/wpMxw0XUu47Yk1ociYA4ZlVlO49zu5mTiYqtPVK1Y2V9TpuGxzXtrZfgKp1d/ANMzrDs4tCwqtKRp0Tj+cf2kuhu9oIB6WK1kBZilYTpr24ESiHjPIx33ikQCTpnR6Ady9juEZr3XO1QUAl75KngVRHDj5Z5pNQvZDxDnIHSXtRNczNfJbNyDGLdpISg9i3Nq2WUkrb7JrCWa7t4r2At4erA8YW0MeyzmE5l3Tlw24LTAK2qr4JgeWkPn+XgncjiyJ8rjy0Jko+7dKqXOOCL+qKe+aQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by CH3PR12MB8284.namprd12.prod.outlook.com (2603:10b6:610:12e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Wed, 2 Apr
 2025 10:59:08 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 10:59:08 +0000
From: Parav Pandit <parav@nvidia.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
CC: Cornelia Huck <cohuck@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "mst@redhat.com" <mst@redhat.com>
Subject: RE: [PATCH 00/13] Backport 1.4 fixes to 1.3
Thread-Topic: [PATCH 00/13] Backport 1.4 fixes to 1.3
Thread-Index: AQHbowsFd2JqpDAL/UicNGhKPNrIArOQG20AgAANVPCAAAVJgIAAB+GA
Date: Wed, 2 Apr 2025 10:59:08 +0000
Message-ID:
 <CY8PR12MB7195C055D9C78F68CCD1AE61DCAF2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250401133543.801184-1-mvaralar@redhat.com>
 <87y0wiapex.fsf@redhat.com>
 <CY8PR12MB71956AADC6DBE9891FE9CA9BDCAF2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <CAHYGQ0x2_QtLBrMmxmzcdNUki5Xjjhvg7e=khYVFWbtnGrYgvQ@mail.gmail.com>
In-Reply-To:
 <CAHYGQ0x2_QtLBrMmxmzcdNUki5Xjjhvg7e=khYVFWbtnGrYgvQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|CH3PR12MB8284:EE_
x-ms-office365-filtering-correlation-id: 250a82ce-dc25-4f33-a6f5-08dd71d5647b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Ums5VkkvaHRaT2xQTHV5TmY5SWN2ZmZTWUZaT2p4eUJuOHVrM0V3MFRlWmJ4?=
 =?utf-8?B?OUJnRUFrd09LY3pub0Y4TEJpdmZFalZpSGlUcVJxVzNobzZHa0pWcC9BLzVN?=
 =?utf-8?B?eXMvdDYyQjZQaG9iUVFzNnFPMkl6ekgwSjdNemFUcEkxOWxEbXV2SjExVE9G?=
 =?utf-8?B?SDQvUTdBWWVib09uQjYxSzNweXJFdTd6Q1E2RGRxV0NkM0E1b0JQZ1Z1bStE?=
 =?utf-8?B?WWpFVjdOSDQwU3BzODJab1BzMG9Eb2JDNzFER1A2Q05QRXBhZy81TVRYay9k?=
 =?utf-8?B?NWx0amtwbFk0dVB5Q2lNcVR4UkR6UWpRWGF2VGd5blExNytEbXR3ZlZ3LzNp?=
 =?utf-8?B?RUJMS1lXL1hZZ0ZLVmRLdTY2OWRaR0pxY0owWVhyZEFRYWJpTmsyYUtXUWtt?=
 =?utf-8?B?Y0FoMzZ6Q0xkYUxWR1A2WW1zc20ycUcyYXVEYWZMcjVwaGwwRnRCWEV3VUV1?=
 =?utf-8?B?c0hpQTQrYU5GVFNmbXJvNld3ZjVZaXBjM2JSSk1zR3ZkcW1Ed2lzekNNUjZV?=
 =?utf-8?B?cDhaTW80ZllxQXk5UklYbll2eDJqdjNlMkN3RGlaMnRRL0Vla1lOUWVVcitq?=
 =?utf-8?B?Y2pqQ0lsVDBHZExSNzhFY3E0NHc0aTc4NWE4NnhJb1h2WTZEc0RIUFdySWpr?=
 =?utf-8?B?WW84RTcvekZsR1lNQVJ1eFRTalVWY1k1VWtRNG1IdWwzQWJ0KzZiT2dLbXdq?=
 =?utf-8?B?Uzd6WmZIMHNzVXlZV3d2ZWFDaWtxQlpRWjlyTERncThzRkt4V3czOHBjSHVz?=
 =?utf-8?B?UHRxQ2cycWNUWlM0ZzdnenFSYVNJNE1EMStpRURXd2xLR2xlczQxSFhWMzhW?=
 =?utf-8?B?TGZPMjJ0TThKL2dia2Y0MFJDMTlCZFFnS0NZQjIxYUg2K1Q3c09QNnc5aUxj?=
 =?utf-8?B?Nk43aElvcmlhUnhTczV5a3plMGovSWN1NG1jMEUxdThpZTBNaEtmQmRQSEtL?=
 =?utf-8?B?MkIyMDJjK1NBcEorOXVDSE51Mk9OVXpPSXBYTkFKNG56UHZHTCtLQ1U3V005?=
 =?utf-8?B?amVnR0VqQUplSExYQUJ1ZTNRNTBxR2U3V1dNbFVLWmZ2aFhYQjZJTldOdzhV?=
 =?utf-8?B?U29pb25XTEVlOWg5bS85Y3Fmb1VEQkg4YW1uUVhDQlF1dzl0cU1DQUxZZmFN?=
 =?utf-8?B?QkZBRTdqcnVwbmViakxrbnF6TXpxZnVmS2V2MzNlNnIvSXYzNFF0bHJ3ZUdH?=
 =?utf-8?B?THc4bm1YejVrVklrTEpBSCs3TDcyQlBHN013a0ZEMkp3cENuNG9XMFI5azk1?=
 =?utf-8?B?T0srVWtlOE5qdi9UUlo2NlY3K2VPYnZkUmFZV1FSTE9ubm9pQ0M1SUlIR1JF?=
 =?utf-8?B?ZWVkUDkrZExuSW13a1lBM2hhWGF2Q29ndnpRVWxrRzRjY2N1aVZQQzliYWp6?=
 =?utf-8?B?SE5tUFhaNUhOM2xGaVMrd0FKbk1qNUNwWTBhM3NDcys5YWZ1b1QvZjAvblVW?=
 =?utf-8?B?emM2K3JEZVVOM2xJUng1OGRJckViWTBFMDhYckUyUnJQcTNZbWlNWFlTeXY2?=
 =?utf-8?B?RWtlV2hxUUl3SE5uZGs1cXFRc2IzK2IvZHJYa0pjNmVtVDlLT3RueXJqK25Z?=
 =?utf-8?B?eklJUVdKd2pDY2dUSXFMYXhsVlNMZ1Zuck4yeGtCVys5WEJDK0NnQ0pkTitJ?=
 =?utf-8?B?SWJCa1dtK3V4WDEyVVFpN1FIdUs1MFFjNkYxemllRk1SaGlpRVE2OE9uRjVQ?=
 =?utf-8?B?L3VWQVZxeGdOMUllSnBPWkFvdndjbjdXWTcybnFRVzVFMnR1MmJqUXVlUk1Q?=
 =?utf-8?B?dGIrc2RORGZuK21yM0ExVHVxRGhiSVNrM1I4Mlc4Uy9IUis4dXFRVXFJeHhR?=
 =?utf-8?B?anlrUEZtS0xrYkFjQUQ5Yks5aUFNNHJmWGR3S2dweHpmOWtjc2YyYlpVdjk3?=
 =?utf-8?B?aWJhV09OZnhYbndCZEIwV0F3MG9PdzhSTkptQnFIYlA3UmxNOVUzNVdJc3lZ?=
 =?utf-8?B?dEpuU2VaTGRXVHdWOUJQbk9wTnlrNDBPVlhqOTlYQmxta0QreWtYeDN0NHhH?=
 =?utf-8?B?S0Z1cVplZStnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z3diRzBLRG5FRUhEZW5OcVFpRFlMbFgwakhDSVh6RXJvYzBuRWRqbjJKYzhS?=
 =?utf-8?B?RzY4ZEtrS2M3VkpkYXBYZVBjRlN1bmYzNHhOei8wYUNTeUZuYTRGYzA3eW1K?=
 =?utf-8?B?MG5NdWlLa05jVTA3U3hIZ25scHl1ZmM4NmRuRWdTUlY1M2JVNmFUaloydERM?=
 =?utf-8?B?eS9uSmhiQktLWGhES0d5TmFjaVZPUXpjSmQ0c2tPTzBZUmN4V3Z1UVZVWWZL?=
 =?utf-8?B?ZG1icUpPcG8yWWpBSng2UzlNRmFkTG1rSEU2MUhwYmkwOTVTcmsvUGNIb0VQ?=
 =?utf-8?B?aEx2NEFTZ3hSS1V6YzB4QkpwZEJENjVOQlIybnV4Q2R3bVhZSDVDK0E1QnQ1?=
 =?utf-8?B?MG9sa1pwSnducnM5c1ZKRU5TUExaRW1KbWtEUWpkaU14VnV4c2N2YmQzNVU4?=
 =?utf-8?B?V0tlQWQ1OTcyeWUyN1JyYnhVcXdKTlNmdE5kVnUrYVJYYkRFeVgraDdtZnJY?=
 =?utf-8?B?OVFwWXRPcmh4ZVZYbC92TXBwK1N4UHRocjdRN2NZci9lWkY0Y3RJMGMzZXhx?=
 =?utf-8?B?azN5RFB2YVpENitCUG9YZkoxdTNEOUNqSlRsenZVdUJQVWdmck5YN1NLOGlm?=
 =?utf-8?B?aC9YTXBQNm5XQjF0M3FsUEp5eDFkQ29JcjNCUExEL25YT3pNdUxmWFZ1cUZM?=
 =?utf-8?B?ZmpDZCtoY2ZaSWM2K2o4OENPUDNpbkt0MGRjNmNKUEM4c1IwY0lUdGgrODZ1?=
 =?utf-8?B?T0FFMTRUcFJTWlRYQkxlS2U3K2dDcUg1cDUwTzRoUm1iNWVBQ3JWUllXQjNy?=
 =?utf-8?B?UUJqYUtPM3ZpWHRYV0hycXUxRVVTUlNFR0hUT2pjVENrTlpWalNiUDJoUzl6?=
 =?utf-8?B?amxpR1B3RGszYnpYS1J2Rk1UN1hLbjVHKzg1VGgybHRiVjJpYnplVm5heGtY?=
 =?utf-8?B?TnB6U1lWMVpCK0NYdlpxSHd0OFBBTWlRWVZpR3FCY3czb2JSVE1QaE11bmpj?=
 =?utf-8?B?dXR1QzdPM3FDVFR3QnJZNENCZndjTmh3Vjk2YXNLY0U4Q0pVdmpFN1lHK1pK?=
 =?utf-8?B?VG83ZzdKTXNMREtwTVZQOHFCMGZYY1c1Tk4za2p1ZlI4UjZseDdheGhSOHA4?=
 =?utf-8?B?LzdyRURwRUNySTFzdUt3Rnl5NjlMTnpDcEZNNm1hR2JWWXRndGl2bFhaUmE2?=
 =?utf-8?B?L0J2MUI4eGJPK3RXQVFTd0N3K0ovaHMxZWRiRkNGTTR6NlZUTWo1SGtTU2dC?=
 =?utf-8?B?MlJ1WlFpYUZ4a3V2YVU0aGs1ay8wR3dkL1RQUHBYTWJGVWpKUHBScXNrZDQ0?=
 =?utf-8?B?MlYxb1hPaDZucVhIQ1R1YmhkVVVLL3Z3bDhPOGQ1eU51UExaT09iSTV3bmFR?=
 =?utf-8?B?MzkxTUJUQmh1NHhUQ1M4WTZ5SUhEdEJlNGg3bDI0RlFGK3Z2cjBrTTk1VGRJ?=
 =?utf-8?B?ZnFUNnREajFVdnlqVS9qSXdKRk4wWVpQQXZTR1JtRDJIRk9VU0ZWQU9DaW9E?=
 =?utf-8?B?clg4VGVncFBuYUl4N0tYTVlyZldscFp4dVBJNk9xV1pZU2l5MktKK0pUZTlH?=
 =?utf-8?B?V1FBSE12NWd5bEFRMVdnM0x6SFlscngva0FFT2VPRHN5YU5GaFdGbFRPZnli?=
 =?utf-8?B?T0ZmWk80RHhOYzc4NFU4TTcxWmFDdTZpZnFETDZvNVdwNnlWbzhqdFpMcC9Q?=
 =?utf-8?B?RWNTMWp3NFJCNW5XbTMzV3ZQWXcxS1J4L0gwVWQ3VjVKZ3dOOFpWTFRvMVQ0?=
 =?utf-8?B?djIrUERubXlmSlZzOUJHYjNNcGI1NVYvTW9YYm1kaXBoQzhISTIrT3N2VTIv?=
 =?utf-8?B?ZzBlRlhqN0x2eitubm5nZGVMQ2lNdzRZa2ZQMzZNeW1vbkJVN3A3Vm1maVA5?=
 =?utf-8?B?cEdjaDdWZnBxOG1kaGVOTkxRMURQcFhRcUdWY3lQcXd1WVhMYnNOT0xzRnVQ?=
 =?utf-8?B?VERYbzlkOHFWT2MzdDNuOHkyWWRmYThoQzFNUm9ad1pQUjQ4bFZDaEZNS2N6?=
 =?utf-8?B?UEZrUW16N0Z5RzkwY21oQlI2YnF0RVRlSnRrZlBNTUdrblhvc1FTdG9nNUpD?=
 =?utf-8?B?ZWJMV0R1cVk3WnZHcDJoVGtaekNXcHNHclBvSWp4YmZ3dE5UV3llNlo5Q1FU?=
 =?utf-8?B?QWFvaGN5MnVFQnJEUXdPZ1RDVjFTNXlFU2NFZjhLK3RqVEU1Ylk1c1BhNTYw?=
 =?utf-8?B?OEhRbmRFT0pmUm9FbEd0dkNjUWt3dkFkRTNJdjM5SHZnMjJaNC9UZHRXOHhL?=
 =?utf-8?Q?Pvsg5efq7y0m6sSqBtgHPVLRxfz/x/nalaE4AYu1Gy8E?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 250a82ce-dc25-4f33-a6f5-08dd71d5647b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 10:59:08.3756
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5vVDY5MMxC4b0kFfC5+JIeUQWP0LcfMlCcYmPBZVIBXq7lF8tL9x+ZGakydtxJM1B6gTepXED3apIsFnmHOBJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8284

DQo+IEZyb206IE1hdGlhcyBFemVxdWllbCBWYXJhIExhcnNlbiA8bXZhcmFsYXJAcmVkaGF0LmNv
bT4NCj4gU2VudDogV2VkbmVzZGF5LCBBcHJpbCAyLCAyMDI1IDM6NTkgUE0NCj4gDQo+IE9uIFdl
ZCwgQXByIDIsIDIwMjUgYXQgMTI6MjXigK9QTSBQYXJhdiBQYW5kaXQgPHBhcmF2QG52aWRpYS5j
b20+IHdyb3RlOg0KPiA+DQo+ID4NCj4gPiA+IEZyb206IENvcm5lbGlhIEh1Y2sgPGNvaHVja0By
ZWRoYXQuY29tPg0KPiA+ID4gU2VudDogV2VkbmVzZGF5LCBBcHJpbCAyLCAyMDI1IDI6NTMgUE0N
Cj4gPiA+DQo+ID4gPiBPbiBUdWUsIEFwciAwMSAyMDI1LCBNYXRpYXMgRXplcXVpZWwgVmFyYSBM
YXJzZW4NCj4gPiA+IDxtdmFyYWxhckByZWRoYXQuY29tPg0KPiA+ID4gd3JvdGU6DQo+ID4gPg0K
PiA+ID4gPiBCYWNrcG9ydCBjb21taXRzIGZyb20gMS40IGJyYW5jaCBpbnRvIDEuMyBpbiBwcmVw
YXJhdGlvbiBmb3INCj4gPiA+ID4gcmVsZWFzaW5nIHYxLjMuDQo+ID4gPiA+DQo+ID4gPiA+IEhh
aXh1IEN1aSAoMSk6DQo+ID4gPiA+ICAgY29udGVudDogUmVuYW1lIFNQSSBtYXN0ZXIgdG8gU1BJ
IGNvbnRyb2xsZXINCj4gPiA+ID4NCj4gPiA+ID4gTWFydGluIEtyw7ZuaW5nICgxKToNCj4gPiA+
ID4gICB2aXJ0aW9fcGNpX2NhcDY0OiBzcGVjaWZ5IG9mZnNldF9oaSwgbGVuZ3RoX2hpIGVuZGlh
bm5lc3MNCj4gPiA+ID4NCj4gPiA+ID4gUGFvbG8gQWJlbmkgKDIpOg0KPiA+ID4gPiAgIHZpcnRp
by1uZXQ6IGNsYXJpZnkgTkVFRFNfQ1NVTSBzZW1hbnRpYyBmb3IgR1NPIHBhY2thdHMuDQo+ID4g
PiA+ICAgdmlydGlvLW5ldDogY2xhcmlmeSBEQVRBX1ZBTElEIHNlbWFudGljIGZvciBlbmNhcCBw
cm90b3MuDQo+ID4gPiA+DQo+ID4gPiA+IFBhcmF2IFBhbmRpdCAoOCk6DQo+ID4gPiA+ICAgY29u
Zm9ybWFuY2U6IEFkZCBtaXNzaW5nIHZpcnRxdWV1ZSByZXNldCBjb25mb3JtYW5jZSByZWZlcmVu
Y2VzDQo+ID4gPiA+ICAgcGFja2VkLXJpbmc6IENoYW5nZSBob3N0LGd1ZXN0IHRvIGRldmljZSxk
cml2ZXINCj4gPiA+ID4gICBkZXNjcmlwdGlvbjogQXZvaWQgc3BsaXR0aW5nIHRoZSB3b3JkIHZp
cnRxdWV1ZQ0KPiA+ID4gPiAgIHZpcnRpby1ibGs6IEZpeCBkYXRhIHR5cGUgb2YgbnVtX3F1ZXVl
cyBmaWVsZA0KPiA+ID4gPiAgIHZpcnRpby1uZXQ6IEZpeCByZWNlaXZlIGJ1ZmZlciBzaXplIGNh
bGN1bGF0aW9uIHRleHQNCj4gPiA+ID4gICB2aXJ0aW8tbmV0OiBDbGFyaWZ5IHRoZSBzaXplIG9m
IHRoZSBzdHJ1Y3QgdmlydGlvX25ldF9oZHIgZm9yIHR4DQo+ID4gPiA+ICAgdmlydGlvLW5ldDog
QW5ub3RhdGUgdmlydGlvX25ldF9oZHIgYXMgZmllbGQNCj4gPiA+ID4gICBncHU6IGVkaXRvcmlh
bDogRml4IHNwZWxsaW5nIGVycm9ycw0KPiA+ID4gPg0KPiA+ID4gPiBTdGVmZmVuIFRydW10cmFy
ICgxKToNCj4gPiA+ID4gICB2aXJ0aW8tbmV0OiBGaXggcmVjZWl2ZSBidWZmZXIgc2l6ZSB0eXBv
DQo+ID4gPiA+DQo+ID4gPiA+ICBjb25mb3JtYW5jZS50ZXggICAgICAgICAgICAgICAgICB8ICAy
ICsrDQo+ID4gPiA+ICBjb250ZW50LnRleCAgICAgICAgICAgICAgICAgICAgICB8ICAyICstDQo+
ID4gPiA+ICBkZXZpY2UtdHlwZXMvYmxrL2Rlc2NyaXB0aW9uLnRleCB8ICAyICstDQo+ID4gPiA+
IGRldmljZS10eXBlcy9ncHUvZGVzY3JpcHRpb24udGV4IHwgIDYgKystLQ0KPiA+ID4gPiBkZXZp
Y2UtdHlwZXMvbmV0L2Rlc2NyaXB0aW9uLnRleCB8IDUyICsrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tDQo+ID4gPiA+ICBwYWNrZWQtcmluZy50ZXggICAgICAgICAgICAgICAgICB8ICA0
ICstLQ0KPiA+ID4gPiAgdHJhbnNwb3J0LXBjaS50ZXggICAgICAgICAgICAgICAgfCAgNCArLS0N
Cj4gPiA+ID4gIDcgZmlsZXMgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25z
KC0pDQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+IGJhc2UtY29tbWl0OiBiNDk1ODQxYThlODBk
MTJjMTEzMGY4ODY4ZjQxMjg4NjYyOTExNDJkDQo+ID4gPg0KPiA+ID4gTG9va3MgZ29vZCB0byBt
ZS4NCj4gPg0KPiA+IEkgZGlkIGRyeSBydW4gYW5kIHdhcyBhYmxlIHRvIG1lcmdlIHRoZW0gdG8g
bWFzdGVyIHN1Y2Nlc3NmdWxseSB3aXRoIHBkZg0KPiBkaWZmIHRvby4NCj4gPiBEbyB3ZSBuZWVk
IGEgdm90ZSBmb3IgaXQgb3IgYmVjYXVzZSB0aGVzZSBjaGFuZ2VzIGFyZSBhbHJlYWR5IHZvdGVk
DQo+IHNvbWV3aGVyZSBlbHNlIG9yIHRoZXkgYXJlIGVkaXRvcmlhbCwgY2FuIEkgbWVyZ2UgdGhl
IGNoYW5nZXMgbm93Pw0KPiA+DQo+IA0KPiBDb29sLCB0aGFua3MuIEkgZG8gbm90IGtub3cgaG93
IHRoaXMgdXN1YWxseSB3b3Jrcy4gSSB3YXMgcGxhbm5pbmcgdG8gZm9sbG93DQo+IHRoZSBub3Jt
YWwgcHJvY2VkdXJlOiAxLiBvcGVuIGFuIGlzc3VlLCAyLiBjb21tZW50IGluIHRoZSB0aHJlYWQs
IDMuIG9wZW4gYQ0KPiBiYWxsb3QuDQo+IA0KU291bmRzIGdvb2QgdG8gbWUuDQoNCldlIG5lZWQg
YmVsb3cgZml4IHRvby4NCg0KMTI0ZmNkMCB2aXJ0aW8tbmV0OiBGaXggcmVjZWl2ZSBidWZmZXIg
c2l6ZSB0eXBvDQo=
