Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2056.outbound.protection.outlook.com [40.107.102.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22181A5B8A
	for <virtio-comment@lists.linux.dev>; Thu, 26 Jun 2025 16:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750953706; cv=fail; b=MiF4LzBRUT+LPVsrwCIorXywv4QOGvwoZzmpS6pj5fylWP+1JNZvTvJZh7/lcz9zNg/PIEellRGIYFoaWJV1Mdd0IYIIlkW4NDf664zbscyh8rlU1ILEX+/QW84MmYYpE6K4SuStqCFq/VYuopkUJTRFiMMUZzyKpN/jkyHftNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750953706; c=relaxed/simple;
	bh=zB4Af3rQC9myXndJD/zl9cT8Pg0peF2hl5GHre0XOeU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Zk3bbw03xbhl7vt+wSuD0f7lAe7e5KC+pEzWB3n+Sp8+A4YJ5Pp4VoumM39QwW5pinDmS2po5tEU7zZ4kDqcHkQ7irQEAasm1vFkAqHgHvGRnpxM/N3O/f2JdcsZeoi5+2+efjrFdJHC71GbdNEnkHv4/TNVKQbL4OYzqJF1FT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ThGe5Yn6; arc=fail smtp.client-ip=40.107.102.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ThGe5Yn6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iLBbOL+Vlf7Q+d2lODrZn6q7XVUM+U/ZWZ/drZUNtHlB1A5AguobK9RxCasg6XqFadHiOI4ZJuFZWAFAZBOJmD1CvIQ4gzzL/Reqss7TK9OfxgeCYjSfO9Z2v5n+SSvYaP8hrgu64waZvwsEMwnrCI3pcKmyyHqCv4aS28g6oB64Y+LBfsMlJdJ0wtieSbtXmhLH9F+8xwMtKUDSPspYpTAk2tZ/9AcnbDyzM+nt4dNqPDprTn3C7eTMRWH/tHwa3YIJ7sELg+WB1Hdf9cP4HY/zxt7n/ZUmm+8UsMW0WZPB3MxrskrgUrdyvSOrx19Wrt9Q1MaLuZjVQnXGaHKzBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zB4Af3rQC9myXndJD/zl9cT8Pg0peF2hl5GHre0XOeU=;
 b=BBnANy98fouXtzOV9YZQUVyZVpwy6qS9zTMWpVWPQxcd/5QgGMZV+ILp0NQ5N/IdqrsEx0jw65K0QxqlU4QE8mKRTA3DXCiHANh4DVAniBZoLgVMfab82dLFijDe/ketciYsASInrX2kuYCUcd4+JHIFyecNzr5x5KIepnY6QdYsxICOQGV1Th6y4byX73C/esV4sc40vYGfxX3uIECujx5od1kE5CbrfPTpp7leaHSvtpJV+5LFtQU7VR5FgiXwLhzzC7NMl2GkuKRYLQfm+KolU+9zUpem9VvoKDCC/qRtqp7tscdIhC3FtNM095v4XXj2aMtSzLV5STy90R9TFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zB4Af3rQC9myXndJD/zl9cT8Pg0peF2hl5GHre0XOeU=;
 b=ThGe5Yn6Fx/wo/d0hn26E6/q3V1TBBFV3mOBZPdfRI1C44u18Al2yzD5cK4pJpZ9F0FfwNloJ1/FlE5bcEY0Kp/pQkJgQq4d6dVkymIfgOFjZbQJ+sPSnRon4R/V1hnwQZalz2PuQxgIQQ/BDKBS7ZNKll4dja79oJZY717JfnxUN4ArCSHfioP9Md+alLQnthBAojBIYMR9oLlF8NiGatlgdoTguSUbUJ3B1ZuT6PVIRQgSfovhTiYIOGV5mQlD6wBj5VelcuDX9dazB0Pz3xTkTQ/P2GT7Ae1dbmC9QOns4B6I4AGuH5s4I/F7/S3GapgtdxfUGiK2GXD3wmVQ2w==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by BN5PR12MB9485.namprd12.prod.outlook.com (2603:10b6:408:2a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 26 Jun
 2025 16:01:41 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%4]) with mapi id 15.20.8857.022; Thu, 26 Jun 2025
 16:01:41 +0000
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, "Zhu, Lingshan" <lingshan.zhu@amd.com>,
	"mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"Ray.Huang@amd.com" <Ray.Huang@amd.com>
Subject: RE: [PATCH v3 3/3] virtio: introduce SUSPEND and RESUME feature
Thread-Topic: [PATCH v3 3/3] virtio: introduce SUSPEND and RESUME feature
Thread-Index: AQHb5BoUXKPusOin/kiYESw2fMoAA7QVWGyQgAAbAACAACZPAIAABOlA
Date: Thu, 26 Jun 2025 16:01:41 +0000
Message-ID:
 <CY8PR12MB7195A1A347F205D765D35F6BDC7AA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250623083637.296041-1-lingshan.zhu@amd.com>
 <20250623083637.296041-4-lingshan.zhu@amd.com>
 <CY8PR12MB71959BD1BFE6319F6E05A7FDDC7AA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <092e01c6-1756-4293-8183-8efea6720548@amd.com> <87pleqh5l3.fsf@redhat.com>
In-Reply-To: <87pleqh5l3.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|BN5PR12MB9485:EE_
x-ms-office365-filtering-correlation-id: e46db00d-7ff2-4617-ebf2-08ddb4cabd87
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NmxyVlFjL0xxeEF0ZHZtWTVCQU5ucmZlcHp4YzdoRjl5cVhuMUROa0ZyYmNr?=
 =?utf-8?B?T1MyOG85TnU0c0lORVNoTmYxWEtaRDF6am9pcDNubXFxK081eFV0K1JWZHJR?=
 =?utf-8?B?cHh5TVdCcFdmYWxXWnQ3NnJlRzVOVnJ1RVlOUDg5dCtGR0N5cFhIM1VyazlE?=
 =?utf-8?B?RkNBdVdNbUVvaFl2TkUrN3RIU1NZNG5SUlBDYUYvcUZLeko2T25OWktxZUlO?=
 =?utf-8?B?UmRHcndvZWRmVE01OHQ2aEc4Y1FNN1hWTEJZTE0yNTNvOGVCZEIvWThQaE1E?=
 =?utf-8?B?ZmNwcXhGYU9Rb2R4M1FzN3dheUUzR0NzaTFjR0JwTDRjYWFjK213VmpWNmw5?=
 =?utf-8?B?RW5GQ1IzUXpMb25WWGNwaTZWSitVamE2V1JMdmJOODlZakFjN1pJdStUMFU2?=
 =?utf-8?B?TFBER21adEJZQUFzeGNsQ1VKNXFWdWFpbnJpM1BsT0dPT0wzYTZFZlRxVmtC?=
 =?utf-8?B?bS9MZVB1Z0J2bS9ZcTR4QnpKcVBvdUx1aTFISkhZVVpqSzdHTEEvYlo5VmN6?=
 =?utf-8?B?R2Z6UjlsalVKNUZLck9ReW03U2VrY29TcHZ1dDhqTXlVTmdWa2JlZGhTeFR2?=
 =?utf-8?B?NDdZTUhhK1diQnhjRW1UQ2NTYWU2REUxNFdEeEYycWkyZXpDR1lMK1hxd3Zm?=
 =?utf-8?B?N2ZaL252bmlHOExLY2cvVjJzQW9pMGdnSDJBNksxK0RUbGdlMDVHcXE2dS9r?=
 =?utf-8?B?YVB4Q1k2YnVNaFNlOFpUdFJYR1AvRkVBalBZVTVzdkNUR2g4ZklpZlhCY0tn?=
 =?utf-8?B?NEJ5MTlVRksvMWtTazZueGk0aEdLM3ZDTjlmcVB5MVBSMlNiTW0zNVZ0NWxG?=
 =?utf-8?B?QUREWlZ4ZWI0a3hJdFFRcVlnSlJHa1VBVnhoWWw2bmZFYVhvTHZ3S3laSUla?=
 =?utf-8?B?LzQ5aW9yQkp4K3pLaGhTY2JmNzR1VTAwZ3VYbS8wd2M2MzVkR2NkS3NXbWQy?=
 =?utf-8?B?WUZvRXVxUEJhQUlHZ3RUbXYyU3lwYkRsYzh2U0Y3VWVqN284aHpTblgwWDFq?=
 =?utf-8?B?cDNieW5CeEhFZ2I2UFR2dTZBZC82dG9RM0Y1TmIycjNXYkZ0Y3JRVk5mWkdw?=
 =?utf-8?B?bHFQOVlrMUh6RHFBMmljbVU5bitXZVFnUkc0b1YwNVdJWWJxWFhXbEhmREha?=
 =?utf-8?B?M2orQUlrclAxNzVrY2pHNXRtRHQzR2tYYzltZzE3bVhPY21tWmZ5Nm93dXRv?=
 =?utf-8?B?TEFET0VYaVU5VmNwZ1BGOVo0S0lMUjV0YVduTnBadnBZaXlsVnZ1REw3Tnla?=
 =?utf-8?B?QXdpbmNIbTBYYlRyREJRN0VRUVgrUlEycWNUSGt6a2xEUE1yNkFhVG9wclZz?=
 =?utf-8?B?UjhhQUNyVW1CMVdDVGtYSWVORG5pUFZ2MzJSUHl6UVlaWUZHQ3AwNzNCT1pE?=
 =?utf-8?B?SGJkUTFpRnlqNUI2MkVLaEw1NWZsOU0vRkdPUUxkbTBXSjBvbDlqTytia3Zh?=
 =?utf-8?B?d1g3d2M5NFRWUDFVUU13Q1FsRkJUZFZBZk9ZS1YvUXdlMlVCUkc2NllIb2lI?=
 =?utf-8?B?aHRKZUNCSmwvcWs3bk9ic1U4KzZqUStEZWdadzRQNXZuV1pNeXBuT3JpWklS?=
 =?utf-8?B?a2d6NmtyUU1zRmNId0F2MUtjaUZwa3E5RHlmUWR5dkUveStMd25zTnRQb2pm?=
 =?utf-8?B?UlNOU0FoU1l5cGJ0WGcxZE9YK3FhWnUvZjlxVysvaWtZcFZ0b3ArYUc3aFJx?=
 =?utf-8?B?eHNLaERNbVJKQjBRSWxEYk51YTRRK2dSVW5SeHhlcG5hckN2Q1dQMnV5alM0?=
 =?utf-8?B?N1dHRmxOUHd2S2t1c3VzUWkzNGhsUGI3UmFDYnh5YXg4RzBUcWNBSUFnM0du?=
 =?utf-8?B?R1dhME91YTA1N3pHQU5IMDJDODZraXdJelZZTml1L2lLZ1ZtTUh2SnlVdzBN?=
 =?utf-8?B?SHcrd3J0eTlpS0kyR2lOWnNxSGlSV1JxbEpRZWRMRGJmeU5RaEs2YnZ0R0l0?=
 =?utf-8?B?MmtqbXVKb3BJY29ML1gyRWlkUXZLWitGakMyYzFhOEZPbk1VTnJiS243UG9F?=
 =?utf-8?B?UXkvaVlnNHR3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RFBDMnZqdzl0bUI4blhsMmZFYWU3WDczL1BSSitDSk5aQW1IY2o3OXJwR1Mw?=
 =?utf-8?B?YkR1NWpCMjR3djZDSkU3UUs4Wk9sRHpwS2huQStYWlZkQmR2Vm4xTDVkSlBR?=
 =?utf-8?B?aUF2YkVDODU3UXh0ckVqbDBtMm1NbkFhYjVzb3BoN3dpa1Q1bHBqa2VFNDRT?=
 =?utf-8?B?THRManp0b1VJQkxEMGF2QjZSUHRiUU5SK1VmR3BaUml5ZS8wejVzbVB4SFF2?=
 =?utf-8?B?dVFUZzBGRHJKZklDR1dGem9Sa2hsWnNseWZ2bDgrbWdkT2VrZ3ltdncxRXZn?=
 =?utf-8?B?Sjl1MzFpMXhITHAvTXdaSGNnTnprY0dyazVwTEZDSm5wZ3RBTzNQaFZ3OHZI?=
 =?utf-8?B?Vmk2b2JUbk45UTdicXFRUVJDQVAvZisrS1M3SUNMUVFXcVREaUhwRlJhb3dX?=
 =?utf-8?B?bTEvM1JLN0FYaWVDNUdueTYwY01kRUU4dTcxSkM4cTQ3Y1ZDZUFjbkxIdUpi?=
 =?utf-8?B?T0ZySDB3clhoSkJpTFFtTXFzK1VHTnhaVFJjZEZUVWU3VitXZlZlczJHbEdk?=
 =?utf-8?B?S1NEL3ZFTTRRSWJKV3lobFZaRjZqNkRjTi9FQ2x0dXI5L204Mm1VRVcwamNu?=
 =?utf-8?B?YkVEZktQdWd6b3FKSUFxa2F2djBwVXhUMzRncFQ1RG1ZSXVIT0lrNlorOGhq?=
 =?utf-8?B?T2VNeXNVZnQ3aFpxUWRvRXlUTnh2ZUlIUFhqanFkUDM5aXV6Z1pqalN3Zmd3?=
 =?utf-8?B?TWw0Y3R0bko1Ym03ZlJWR01OVzdjTUJaNnh2RzBhNTE4YzdwYitQQ1A4TG5K?=
 =?utf-8?B?dDlNekl3WTZmTU1PS1pqQXJyS1VTaUtLanViajV3L09RZDYxWFNseWxVR3JM?=
 =?utf-8?B?ZjEyZEdsZ0hPNWlCNDByY1pUYVVTUlQrUFE5UGRtdzFVS1dnb0llVXhuRTNq?=
 =?utf-8?B?bXpybUhNNERnWWEzVnAzK1NDaitqbkdQWFdFVlhpdFZkemo5SzZhUkhWOGJ4?=
 =?utf-8?B?QWFsQ212VndTa2w3Y2RCOEcyeVorRVFSOVhNNlk0S1dKOFNxRU1HazNRN2tJ?=
 =?utf-8?B?MXQrWElFTnZsdURRSUYxU3FWcWtDZ2g3VEtVOXN1eGlDcDlmWTE3UGJxNTdW?=
 =?utf-8?B?WlVIc0R4Wk9DdkRLSjMxTk1sRUt6L2tMQVlIWjIrK3Y0T2M0dHUzaGpZSTkw?=
 =?utf-8?B?WnhhKzNuQm9wUTNqQzZHUFZkYXE3U3NvUVptalFiU29VME9ublNGeU9TRE1E?=
 =?utf-8?B?Y2VXZzJSUDFLRW1SUDhQb1EvLzNMMmNER25hQ21ITUZLd0s0MTFxbXRDNUo1?=
 =?utf-8?B?eWcyVlRNemk4OUtmSEVQL1g4WFFKUjcyVGFBNkdXc0dHelBqK3FUaGV1dlNj?=
 =?utf-8?B?bG5BM3B1Y2FIQ3ZKZXF6NWt1M3pnd3hVQ1huUUdXSkp3NklGaVppV3dhbm1v?=
 =?utf-8?B?NHR5REFXZTQ3MDlVcjJ5S0ozQzNrclg1TGhpOFVqRzRjKzJPSXUvQlppeE9B?=
 =?utf-8?B?cGViVTVpczhIdHZqYTlQcW5kNzBCNHRDMjZiR3F5MFEySnR4UlZQZ3ZLckht?=
 =?utf-8?B?d3VWaFk5UGVGampWQklUbGhSWlUyYldreGg5UTkwWEhRNUkzSXVUNkJQbzNN?=
 =?utf-8?B?NjY5M0k4MHZKQjJSanZ5R0d1Wnc3T1cxdDY1ejR5K3VJVzNlY0VqRnlFaUN1?=
 =?utf-8?B?TWMwaE50L1V0Z2hCbmsxSEJNUmVlYUhUalR6WXp6Y3VobzduYWQwYnF4bWwz?=
 =?utf-8?B?YzgvS3Jqc0xoeGhYNXI4QzY3WG1RdFJBSktKWTdVc1V6bmRoclN4VUpPN1Nk?=
 =?utf-8?B?NEI5U2plMXlnQmQzUUZrbUg3VURwNnZ3bVREMDFqUE5yWFBGVExZZHZiQTkv?=
 =?utf-8?B?UTM5aldzM2lYTE5Zdk9rRFpkak5nQVY1R2JmMk45QXZtcGg3c0pOeGV5OU41?=
 =?utf-8?B?SEtwZldXVytndnB1bFVHWTRLNm9KWUsxUUpCQityak51YzhvS0VHZ3A0NVox?=
 =?utf-8?B?bHUvNDlHaFVhWU8yRGpaNVBkQWJNUzlPajY1ZHE0TVVIQno3YitDOXB0UWVt?=
 =?utf-8?B?VEtCSGV4TE1VR2RGMUdRM1lCRGErZG5JR3h1QjhOUVVteXNra1hlK1IxSEVt?=
 =?utf-8?B?c1cweENsL0ZBeUcxdDEyUHJ3Vm9vc2lhb2dDWEVJMFRRbHRUMWF0OWZEU3A1?=
 =?utf-8?B?a3VVVW9uK253anVFWWZTdU8wU3JkdHRLd3dabVNRYlk0WU1QWlQ0aEw3V29M?=
 =?utf-8?Q?YIxjHZuT/neL338DTUOmJmAu8uj/xLwuJv+2/pVnq73X?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e46db00d-7ff2-4617-ebf2-08ddb4cabd87
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 16:01:41.1977
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3i0UiDI10lnlUfIIVEXt7UPGnu7jVBtjOshO0fUDp7eyM6La2j+i0NuNOacoWZxh4q1/qfl8PvEdRMT6vNVTAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9485

PiBGcm9tOiBDb3JuZWxpYSBIdWNrIDxjb2h1Y2tAcmVkaGF0LmNvbT4NCj4gU2VudDogMjYgSnVu
ZSAyMDI1IDA5OjEzIFBNDQoNCg0KPiBPbiBUaHUsIEp1biAyNiAyMDI1LCAiWmh1LCBMaW5nc2hh
biIgPGxpbmdzaGFuLnpodUBhbWQuY29tPiB3cm90ZToNCj4gDQo+ID4gT24gNi8yNi8yMDI1IDc6
NTkgUE0sIFBhcmF2IFBhbmRpdCB3cm90ZToNCj4gPg0KPiA+Pj4gRnJvbTogWmh1IExpbmdzaGFu
PGxpbmdzaGFuLnpodUBhbWQuY29tPg0KPiA+Pj4gU2VudDogMjMgSnVuZSAyMDI1IDAyOjA3IFBN
DQo+ID4+PiBAQCAtNjI5LDYgKzYzMiw1NCBAQCBcc2VjdGlvbntEZXZpY2UgQ2xlYW51cH1cbGFi
ZWx7c2VjOkdlbmVyYWwNCj4gPj4+IEluaXRpYWxpemF0aW9uIEFuZCBEZXZpY2UgT3BlcmF0aW9u
IC8NCj4gPj4+DQo+ID4+PiAgIFRodXMgYSBkcml2ZXIgTVVTVCBlbnN1cmUgYSB2aXJ0cXVldWUg
aXNuJ3QgbGl2ZSAoYnkgZGV2aWNlIHJlc2V0KQ0KPiA+Pj4gYmVmb3JlIHJlbW92aW5nIGV4cG9z
ZWQgYnVmZmVycy4NCj4gPj4+DQo+ID4+PiArXHNlY3Rpb257RGV2aWNlIFN1c3BlbmR9XGxhYmVs
e3NlYzpHZW5lcmFsIEluaXRpYWxpemF0aW9uIEFuZA0KPiA+Pj4gK0RldmljZSBPcGVyYXRpb24g
LyBEZXZpY2UgU3VzcGVuZH0NCj4gPj4+ICsNCj4gPj4+ICtJZiBWSVJUSU9fRl9TVVNQRU5EIGlz
IG5lZ290aWF0ZWQsIHRoZSBkcml2ZXIgaXMgZWxpZ2libGUgdG8NCj4gPj4+ICtzdXNwZW5kIHRo
ZQ0KPiA+Pj4gZGV2aWNlIGJ5IHNldHRpbmcgdGhlIFNVU1BFTkQgYml0IGluIFxmaWVsZHtkZXZp
Y2Ugc3RhdHVzfSB0byAxLCBhbmQNCj4gPj4+IHRoZSBkZXZpY2UgU0hPVUxEIHNldCB0aGUgRFJJ
VkVSX09LIGJpdCB0byAwIG9uY2UgaXQgaGFzIGJlZW4NCj4gc3VzcGVuZGVkLg0KPiA+Pj4gKw0K
PiA+PiBZb3UgaWdub3JlZCB0aGUgaW5wdXRzLg0KPiA+PiBJIGRvIG5vdCBhZ3JlZSB0byBhZGQg
dGhlICJTSE9VTEQiIG5vcm1hdGl2ZSB3b3JkaW5nIGluIHRoZSBnZW5lcmFsDQo+IGRlc2NyaXB0
aW9uIGFyZWEuDQo+ID4+IFRoZSByZWFzb25pbmcgaXMgZXhwbGFpbmVkIGFscmVhZHkuDQo+ID4+
IFBsZWFzZSBhZGFwdCB0byB0aGUgZXhpc3Rpbmcgc3R5bGUgb2YgdGhpcyBzcGVjIHRvIGtlZXAg
dGhlIG5vcm1hdGl2ZSBpbg0KPiByZXF1aXJlbWVudHMgc2VjdGlvbi4NCj4gPj4NCj4gPj4gSWYg
VklSVElPX0ZfU1VTUEVORCBpcyBuZWdvdGlhdGVkLCB0aGUgZHJpdmVyIGlzIGVsaWdpYmxlIHRv
IHN1c3BlbmQNCj4gPj4gdGhlIGRldmljZSBieSBzZXR0aW5nIHRoZSBTVVNQRU5EIGJpdCBpbiBc
ZmllbGR7ZGV2aWNlIHN0YXR1c30gdG8gMSwNCj4gPj4gYW5kIHRoZSBkZXZpY2Ugc2V0cyB0aGUg
RFJJVkVSX09LIGJpdCB0byAwIG9uY2UgaXQgaGFzIGJlZW4gc3VzcGVuZGVkLg0KPiA+Pg0KPiA+
PiBJcyB0aGlzIHJlYWxseSB0aGF0IGhhcmQgdG8gd3JpdGUgYWJvdmUgd2F5Pw0KPiA+DQo+ID4g
SSBiZWxpZXZlIHlvdSB0b3RhbGx5IGlnbm9yZWQgbXkgcmVwbGllcyBpbiB0aGUgbGFzdCB0aHJl
YWQuDQo+ID4gVGhlcmUgYXJlIG5vIHJ1bGVzIGZvcmJpZCB1c2luZyAiU0hPVUxEIiBpbiBhbnkg
bm9uLW5vcm1hdGl2ZSBzZWN0aW9ucy4NCj4gPiBOb3cgaGVyZSBJIGNvcHkgdGhlIHJlcGx5IGhl
cmUgYWdhaW46DQo+ID4NCj4gPiBJbiB0aGUgc3BlYyBzZWN0aW9uIDEuMyBUZXJtaW5vbG9neSwg
aXQgc2F5czoNCj4gPg0KPiA+IFRoZSBrZXkgd29yZHMg4oCcTVVTVOKAnSwg4oCcTVVTVCBOT1Ti
gJ0sIOKAnFJFUVVJUkVE4oCdLCDigJxTSEFMTOKAnSwg4oCcU0hBTEwgTk9U4oCdLA0KPiDigJxT
SE9VTETigJ0sIOKAnFNIT1VMRCBOT1TigJ0sIOKAnFJFQ09NTUVOREVE4oCdLCDigJxOT1QgUkVD
T01NRU5ERUTigJ0sDQo+IOKAnE1BWeKAnSwgYW5kIOKAnE9QVElPTkFM4oCdIGluIHRoaXMgZG9j
dW1lbnQgYXJlIHRvIGJlIGludGVycHJldGVkIGFzIGRlc2NyaWJlZA0KPiBpbiBbUkZDMjExOV0g
YW5kIFtSRkM4MTc0XSB3aGVuLCBhbmQgb25seSB3aGVuLCB0aGV5IGFwcGVhciBpbiBhbGwgY2Fw
aXRhbHMsDQo+IGFzIHNob3duIGhlcmUuDQo+ID4NCj4gPiBSRkMgMjExOSBzYXlzOg0KPiA+DQo+
ID4gU0hPVUxEIFRoaXMgd29yZCwgb3IgdGhlIGFkamVjdGl2ZSAiUkVDT01NRU5ERUQiLCBtZWFu
IHRoYXQgdGhlcmUNCj4gPiAgICAgbWF5IGV4aXN0IHZhbGlkIHJlYXNvbnMgaW4gcGFydGljdWxh
ciBjaXJjdW1zdGFuY2VzIHRvIGlnbm9yZSBhDQo+ID4gICAgIHBhcnRpY3VsYXIgaXRlbSwgYnV0
IHRoZSBmdWxsIGltcGxpY2F0aW9ucyBtdXN0IGJlIHVuZGVyc3Rvb2QgYW5kDQo+ID4gICAgIGNh
cmVmdWxseSB3ZWlnaGVkIGJlZm9yZSBjaG9vc2luZyBhIGRpZmZlcmVudCBjb3Vyc2UuDQo+ID4N
Cj4gPg0KPiA+IEhlcmUgdGhpcyAiU0hPVUxEIiBleGFjdGx5IGNvbmZvcm1zIHRvIHRoZSBkZWZp
bml0aW9uLg0KPiA+DQo+ID4gIlNIT1VMRCIgaGFzIGFscmVhZHkgYmVlbiB1c2VkIGluIG5vbi1u
b3JtYXRpdmUgc2VjdGlvbnMsIGZvciBleGFtcGxlOg0KPiA+IDIuNS40IExlZ2FjeSBJbnRlcmZh
Y2VzOiB3aGVuIHVzaW5nIHRoZSBsZWdhY3kgaW50ZXJmYWNlLCBkcml2ZXJzIFNIT1VMRA0KPiBy
ZWFkIHRoZXNlIGZpZWxkcyBtdWx0aXBsZSB0aW1lcyB1bnRpbCB0d28gcmVhZHMgZ2VuZXJhdGUg
YSBjb25zaXN0ZW50IHJlc3VsdC4NCj4gPg0KPiA+IFRoZSBzcGVjIGRvZXMgbm90IHNheTog4oCc
U0hPVUxE4oCdIGNhbiBvbmx5IGJlIHVzZWQgaW4gZHJpdmVyIG9yIGRldmljZQ0KPiByZXF1aXJl
bWVudHMgc2VjdGlvbi4NCj4gPg0KPiA+IEBNU1QsIHdlIG5lZWQgeW91ciBpbnB1dA0KPiA+DQo+
IA0KPiBOb3QgTVNULCBidXQgeW91IGNhbiBoYXZlIG15IGlucHV0Lg0KPiANCj4gV2UgcmVmZXIg
dG8gdGhlIFJGQyBmb3IgdGhlIGRlZmluaXRpb25zIG9mIFNIT1VMRCBhbmQgZnJpZW5kcywgaXQg
ZG9lcyBub3Qgc2F5DQo+IHdoZXJlIHRvIHVzZSB0aGVtLg0KPiANCj4gVGhlIGludGVudGlvbiBp
cyB0byB1c2UgdGhlbSBpbiBub3JtYXRpdmUgc3RhdGVtZW50cyBvbmx5LCBzbyB0aGF0DQo+IGlt
cGxlbWVudGVycyBoYXZlIGNsZWFyIGd1aWRlbGluZXMgb24gdGhlIHJlcXVpcmVtZW50cy4gVGhl
IGxlZ2FjeSBzZWN0aW9ucw0KPiBhcmUgYXJndWFibHkgYSBzcGVjaWFsIGNhc2UgKGZvciBpbXBs
ZW1lbnRlcnMgd2hvIHdhbnQgdG8gc3VwcG9ydCBsZWdhY3kNCj4gaW1wbGVtZW50YXRpb25zLikg
SSBkb24ndCB0aGluayB3ZSB3YW50IHRoZSBhbGwtY2FwcyBrZXkgd29yZHMgbGVha2luZyBpbnRv
DQo+IG90aGVyIHNlY3Rpb25zIChhbnkgbW9yZSB0aGFuIHdoYXQgbWlnaHQgaGF2ZSBoYXBwZW5l
ZCBhbHJlYWR5LikNCg0KKzEuDQpMZXQgbWUgc2VuZCBhIHNob3J0IHBhdGNoIHRvIHVwZGF0ZSBv
dXIgInRlcm1pbm9sb2d5IiBzZWN0aW9uIHRvIHByb3ZpZGUgdGhpcyBndWlkYW5jZS4NCkl0IHdp
bGwgYmUgdXNlZnVsIGluIGdlbmVyYWwgZm9yIGV2ZXJ5b25lLg0KU2VuZGluZyBzb29uLg0K
