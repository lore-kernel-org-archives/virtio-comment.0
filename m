Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A0E16B72E
	for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 09:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718183986; cv=fail; b=pYztRztlb71/gZoFDF/HD/7sKxJZi4l5JcdBUSpYKdb+NuS5vJOp/Ux5hA6UYq+jGu4TH7tCqnJky1xOVBSAnx4k9APbai7mtj+JjlULa9CO9IYemeqnE2+m0/DNMT8Uk1k6YPC6JATnxWQycyZYsD/EWlfci3qcqRC7P4qf9EM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718183986; c=relaxed/simple;
	bh=OazK42YLgS3ilWKMvPNGejVETXM1c3z89ZaUVevu+vs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=epcraZFlaZORM6ne76mmLV59tsOKWRcPmIOTOPKFKYDOmk1Gw/t6l33tM30Be7X8wHx57l8Rl7UNECQ39W1bJahic0MugOUpFLKJ2rO+qajxGPXZDRrnbMyo0eqU09lVumi4kF62V56cMedZC2m34oqZ41N4Zxg3TFjzkBnRgBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NmUDLNg7; arc=fail smtp.client-ip=40.107.94.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NmUDLNg7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WOby5NdbRtuH9bu61c7WMZjPsCqPfN3VDgZXCkVHLOSH/G4QTu2rEHxQdBzb07K3I9t8LVb3II3HpR/rrP9hfTMnvUMYbCZg3Agjqjm/O23UpHX9v3GdBZ8/cAQo7KQ23XliAVdVzw+VV7thL/ucQ4uNtNhN0xFq47YYr6ZiLdHYCcKqs5oFaJ6TkqYlk4paz3T9JMLFJXgVKu7PhJmAh0eqM18CYwGkms0EGKzikbZ4mLqBm2m/ZBfC/fzQoyiYl3fy1NZh3QU+rfHRDwA2i98Ar5QrnC8zt4w2+MKfIa5bX95osdNT5osVm2H0MaxihibZ22VAnqzYf80s7AcofQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCRXz1rqZrMkgcs90V0LRYW7tzlt/ePmwy10VHGzSaA=;
 b=YxWfEhgPGCR0DbXpHmTORvepaUEsIx54XKiXSG/uoPNNKP0PjNdnb28WnYjbqIn6qnh4vhab/97zNkSiWISUdS9SMGoene48wAqxJTMTZQBVt6ASeWJNrY8s3qedsrqcCnzrgmaZdmSfiAx1maEX8DiUNYesMCjNxzRoJ5n9Fuoxgo97k3I/tuodK+ZTSFx2KBPpBdDuBGz1ALmwFNob1i6FOMBBoYXkTMUyL7bc0SQ+iRwuzgAW0vlLQcfC2yd/9qIKX4dpHVCqc5NoGC8tn4LSKBow0NkHKKj/5dQx85JKiEGrbRk4n42L8Pwaq1AZ334Nq/gjcqY9CjYjG3AMZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCRXz1rqZrMkgcs90V0LRYW7tzlt/ePmwy10VHGzSaA=;
 b=NmUDLNg7Pjjt/Rw1f/+P/2D/Uht/2fPCoYyt7KWezdeS/owwI0J/2lvffoP7nS8WYwkYJMPzLoudPM2Fr3NKbf8+YxJaXWmipdl7e2B4B7N8uPr4+fAoEGx9ZLtgeLtjjoXXNi1qUnUsmi888c3GxPdzzQDu/Kddlpu8IiR5HLo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by LV2PR12MB5728.namprd12.prod.outlook.com (2603:10b6:408:17c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Wed, 12 Jun
 2024 09:19:42 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%3]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 09:19:42 +0000
Message-ID: <e25f93cd-baa3-4a54-bf9c-1fc27fa95c41@amd.com>
Date: Wed, 12 Jun 2024 17:19:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] virtio: introduce SUSPEND bit in device status
To: Parav Pandit <parav@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 David Stevens <stevensd@chromium.org>
References: <20240607074246.7647-1-lingshan.zhu@amd.com>
 <87zfrskcmq.fsf@redhat.com>
 <PH0PR12MB548111206A0EEB7EE62421FADCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <3319f7da-5c1f-48ff-916d-03791edf1783@amd.com>
 <PH0PR12MB548190E2CCAED2E01410F79ADCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2657c74f-1caa-4e5e-b767-b16e059247ae@amd.com>
 <PH0PR12MB548198E64803B0A7D9389E9FDCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2f9636c7-06ca-49ec-ac86-f8a2f1f97b4f@amd.com>
 <PH0PR12MB54813032E8F5B0DA32BA1B23DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <PH0PR12MB54813032E8F5B0DA32BA1B23DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0100.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::7) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|LV2PR12MB5728:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e6d9549-314e-46cd-35cc-08dc8ac0cac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|1800799016|366008|376006;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?clNjdWFiZ2ZucEJzNHhQYlpINXJSUXlDcFZLMSswQ3pFYUFlbU9WaHAwUFJw?=
 =?utf-8?B?UDVLVGhNYkhXM3lyMjFxRDdmWFdFY0hiNlc3SzhNUitydi9lNVI4WlZGKzh0?=
 =?utf-8?B?dXZBMklaL0VkaVRxRkNTYnUxK282UXVucjZhK1JrUzJtN1NKSk4zZFFyZkp5?=
 =?utf-8?B?eG12Z2tyNkZ5WUdBM3BiVUxzZElWOVpLUzNJYy9IZUVHS1A2TG8yRkZ6dENW?=
 =?utf-8?B?bGNqbit3b2lrd1IyeSt2cUNmZXk2ZE5sQXhGTktnb3dzVXJJMmlScWFoVkdZ?=
 =?utf-8?B?eUxoYmNmVGNRQkFMRWdpOUpGOUw0cWY3elJHbXpjUFg1YlhIY05yV3BYK0Jz?=
 =?utf-8?B?UXJqTVV6VnVWSjlVM0lOUWtVQlVPSlNDc1BQSGI5MHVNWjNPaGdUdnJYQUo1?=
 =?utf-8?B?UjVMbUJyQmZzSDN5M1lIN3JIRnlPVThzRDNUVGRVcFNOQU1zYjJNdjRwd05m?=
 =?utf-8?B?TjFNMzFVNWlobGNrbTFSdy92WUhuWTFGek5UMk45Yy9OTzhaRDNVeklVUnF5?=
 =?utf-8?B?VDhFV291VVZ0N2xEcndYbjhrbUZtUWpIakwyem1vNEpYUmoxQ3kzdGo4L2VI?=
 =?utf-8?B?ZFNZZ2FuamFGb1hrbU9RaytnQmRYd3ZNM295SXVBZ3huWmh5dzdxSFUwQ1Az?=
 =?utf-8?B?eDVtVEdNejVaSE1KSm9EZVErQldncTh5OTNSS20rZmt6bWNIWXFmSFFTNFFu?=
 =?utf-8?B?ekZYUm13eDIxUTJUU3c4ZlRzQ2RaSGdGRmppSE5GM1YwR2hMZmpYbE9NREhS?=
 =?utf-8?B?OUplZGJjVEVDNXpCZnNnZG9WS1Nwa0lnWjNwZ1V1bG1rY1hMUWJybnV4UUND?=
 =?utf-8?B?cmxyeDZsdlpiRmRLclR6WmxnTmw0aktGWDdHZ0RnNWVnR1N4d2lDQ21HZHk2?=
 =?utf-8?B?LzFqYkRtZDZkL0RlUm1LMlVEL2lxZVRoNlY0anl0b0VobWVVa0h4Z3dTT01M?=
 =?utf-8?B?eWx0clpSc1BqZjhnTWxSQmRaWUdYcDZNY1NOMFNiQ2oycHVUK082NTBtUyt2?=
 =?utf-8?B?dlZQSTZRbzhEOUZESVIvOW1HSmptTzFldUoxTHlNUjhCeGNDVXhmdVpEcW1j?=
 =?utf-8?B?QjdobUFla2N3N1BBRThZZEs0UXkvOVdlc3lQUlpzZ01Db05uOFhmQjBOWldv?=
 =?utf-8?B?eW9jQis1TlFDcUdWamtiWmRKT1I5OWVBN2prc2ZwVE1mTlVMNWpDOGpvM3pD?=
 =?utf-8?B?bHFINlZjYUdEaFhwbnVleFloL1dGM0htNUFQYWt4RTF5Q1cybEQwUlJ6SGZY?=
 =?utf-8?B?S1M0N0FCNHk2WjVBQU9Wa3lyeTlzeGxZRkwzMyt3cTJrWG9lRzFMN1lHQXlT?=
 =?utf-8?B?NllWOGR5ZTJaOHg2U2E3bFI3NjM3OTBHS0YzblV6Z09IeGlxNDZxdWIzVi9t?=
 =?utf-8?B?NkQ3M1ZicTExQmJjTnQwWC82VVF2OEZ2RnF1SVVXVHQwcHRyb3pOaXBienQz?=
 =?utf-8?B?WFlmNnlwQjU0cEVROXhvajQ3NXREejRRY2FzZkdpVE9CeEdTQXNTNUNDN21i?=
 =?utf-8?B?YVcwQ1ZHek9WaEZ2K0pDcjJkaXpZV3dFK3pXWmJ2VnBsMTRic2hBSzM4Qm05?=
 =?utf-8?B?YnRJWHpETkxVRGQ4enVkMXFKSFJMak1RYnlDbnNwRUFhcGV2Ri8rZk5qeS9y?=
 =?utf-8?B?d3VmYlZyeGd2MDJIZ1FtMXJlT3VMYUlMMHRYR2N3RU5PcVBDYkJRVHRYbWR4?=
 =?utf-8?B?WVlkQmlqa1ZScU1PM3hxN0FDMjB4Ky8wUUpEcmg0ZmVmeFlaakljaXU5TWkz?=
 =?utf-8?Q?jef53VyQCASWOxzH8cnVV3i6PUJjGxkff6+Bbpk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(1800799016)(366008)(376006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUdaanFnOTBIKzBjSnR6MTFONE1jK21vY3VuKy9sZExCdW9IejlITHQ2RGt0?=
 =?utf-8?B?WDVtTXNpcTdqa011RTVjSWYvOEdKc1VSb3Ntb0dyOHlsL0RvcHE2Q2dUUjhl?=
 =?utf-8?B?LzBkWGhmTGUzbWhwVndQcUlJZ2xRUjdoTHlVUlZlYTZyaFlmOW5pTVhFWXdW?=
 =?utf-8?B?NTV4SktxbnhKYWtFak5ScjNrMTBBaTFIMll3TnI1RzJZZ2ZxUTJIUER4M240?=
 =?utf-8?B?ZUYwRUdLd1plUEt2enM3QkM1TXNvaW5TckxObTQ3YXp1SWRQOFM0N1dOWmsv?=
 =?utf-8?B?RGRnZWhsc004QUhJdnY3Ny9wb0djN0ZLeS9vckZTVzU2WmJmNU03aTlHNEVR?=
 =?utf-8?B?SmxVTWtvbi9lN3R4TDZodUhvZll6L3pWTERlSW9IZ3RmYjFIVFNZZEJDMGxH?=
 =?utf-8?B?aTFOQmlCU2szcTlJNWl0T00rTTJLVzcwRi8vUlFUNFdLRjlyVHkvL2tEMjV2?=
 =?utf-8?B?Mm81WHhWM2hzWjJZWkJFUk1Tbm5tWEl5ckVpYU0zY01hMmprYURHMzA5SUNV?=
 =?utf-8?B?aGVLM2t6bzV0WVpQY3dFL0VqSGxsMXVJUnZTVzA5RzEzTmRHWG9jc2diRVh4?=
 =?utf-8?B?YlNVZTh1Y0lKRGhHOU5JMW5IcG5NYlVZZ2VpRy9tMVV5WVVhem5aRE5kLzdU?=
 =?utf-8?B?UTVtR010Yk00MVJOWUl0eHU4K3Q2TTE3ak9HelpoZkdqYTU1dFNOTFZXaEF5?=
 =?utf-8?B?UVAvWHRPQUY0MVBLWDJRZHZPeHlVU0pHZ200TFhKMENhd2hJWGRYVkUxVVlh?=
 =?utf-8?B?bERSQmN3M3JnTGVkbks2Z0hob2lIa3pUeDVhMGZDS0JHc2hjQlQzNW1FVXhs?=
 =?utf-8?B?YzNUS1hESG5ZeDRtR0dDVm8waHZLQk95SE9lem5STXBDWG5uSEdWaG1xV2hO?=
 =?utf-8?B?Y3NoUW4xaWZKRjBDV0dMRVBjUlBVYnkzY0dabkZuRTRad001K3ZFcXp2ZzZ1?=
 =?utf-8?B?c2FSWm5RLy9SbW9WNy9TMXVYSzluSGhMT24vZ1VwSk93amt3Vnc1eDJhVkxv?=
 =?utf-8?B?OVJKZDhPaU5vRFV5SHI4VlMrK1VRYStGU1BYSWd6azQxUi8ydXh0TDNrQzlm?=
 =?utf-8?B?UW81eVFadkxwMTRzQVpFUkxGRDAzZEVqcDJoRjJzdjJDaWZXMzNXUEs5TFN0?=
 =?utf-8?B?MHRZS01OOWlMeVNXSXFVK3hUWTA1cXdTQ0lRaEdkNUM3RXJPcG52dUlFbG5y?=
 =?utf-8?B?eU9zZXpUUmdGbCtqUzdhV2ZWUUdsS2UrV2xpbk5mQUxOS0VRQXE1OUxxbDBS?=
 =?utf-8?B?ZE9pUGZIVURBbUdFeGN0T2Y3YmNXS3ZNMDBFaE1tMUFkby81K25hb09ramtO?=
 =?utf-8?B?d2pVT0cwYjdtK1ZMazhnejlOd0FXVEdKSmIxR1NhMXdOWHJwWmRQQ3JDWWNW?=
 =?utf-8?B?aG45LzJPV3dma1ZEMmtmdUxDSU12ZEpnaGJ5Q2JiRjJ4Vlo3aTFSTzBYellC?=
 =?utf-8?B?UUUzR0ZtWWhpSXVwY1VGRnBiRytWTFl3bDRWODVuNWFIcVpSZHBTdTBDMzli?=
 =?utf-8?B?ZHErQTVLMHlXUzNjd2VpMDcvTlZUckt0RjFPVUtmWStyRDN6SXhoR0hTL1BM?=
 =?utf-8?B?My85M2d2ZXV3Q1ZGYVJQeHZTWGlab0tiTDgrZzZPQlFMSVhqZ3JsVFZYTitO?=
 =?utf-8?B?OXBRenF4c3paOC9naGhYWHRROGNGdUl6V3c0RURTay9wNy9RaHc4N1Jhcnhx?=
 =?utf-8?B?Qi9MVmQyRE12b2xEUm1oOGEzamxnTXFvRncyL2taa2dZbWhrMmdqRWpkZ2Fn?=
 =?utf-8?B?ZGNYZzhCcmx5TUd0dWhvcU50dVRkN0ROY3lzWFlHOHpQU1c0RHd0Y3RLVnVM?=
 =?utf-8?B?U3BhSCt0dzB5Ymg0ZUp0Q2RleUkrUlV3eDYyUFcrR2dBZGFHRVNmM1RSVXJz?=
 =?utf-8?B?NFNSRWg5TUZLVEUyazkzYlk0ODZxQmZtWEZvQ2dGY0tRcURmb25KaDNjUGlM?=
 =?utf-8?B?ZXFiVmFTOGJsdVFpTFkvQVdIamhhMGIzSzFsdVlVUWRYNTIvNUhNUGhaV0Ra?=
 =?utf-8?B?blFPMVhQOTluT2JGWDJJd0hyNmxrWlc5d1Q3WmJPL0d4VmZkYm92b1NGRGd4?=
 =?utf-8?B?KytoS0ZlTjVHbXhjQ1lLVmFJM0orNFZGZ1FPeVFGS0lrTmdIdzBDZHJXdzFt?=
 =?utf-8?Q?AIZtTX4xMX9a9bqMKSWKAyyBd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e6d9549-314e-46cd-35cc-08dc8ac0cac1
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 09:19:42.0386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +PnrIJxVEOX+oNVDKd0HOa8B2GdrysHNGc2ky9gyxmNrFc7u5+vZB8RrvrlSuaPWYus26wEH1RqKCHQ5YwIeQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5728



On 6/11/2024 6:37 PM, Parav Pandit wrote:
>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>> Sent: Tuesday, June 11, 2024 3:42 PM
>>
>> On 6/11/2024 5:43 PM, Parav Pandit wrote:
>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>> Sent: Tuesday, June 11, 2024 3:03 PM
>>>>
>>>> On 6/11/2024 4:48 PM, Parav Pandit wrote:
>>>>>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>>>>>> Sent: Tuesday, June 11, 2024 1:57 PM
>>>>>>
>>>>>> On 6/11/2024 1:17 PM, Parav Pandit wrote:
>>>>>>> Hi Lingshan, David,
>>>>>>>
>>>>>>>> From: Cornelia Huck <cohuck@redhat.com>
>>>>>>>> Sent: Monday, June 10, 2024 9:34 PM
>>>>>>>>
>>>>>>>> On Fri, Jun 07 2024, Zhu Lingshan <lingshan.zhu@amd.com> wrote:
>>>>>>>>
>>>>>>>>> This commit allows the driver to suspend the device by
>>>>>>>>> introducing a new status bit SUSPEND in device_status.
>>>>>>>>>
>>>>>>>>> This commit also introduce a new feature bit VIRTIO_F_SUSPEND
>>>>>>>>> which indicating whether the device support SUSPEND.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>>>>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
>>>>>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>>>>>> Signed-off-by: David Stevens <stevensd@chromium.org>
>>>>>>>>> ---
>>>>>>>>>  content.tex | 69
>>>>>>>>> +++++++++++++++++++++++++++++++++++++++++++++--------
>>>>>>>>>  1 file changed, 59 insertions(+), 10 deletions(-)
>>>>>>>> Can you please add a changelog? Especially as some of the
>>>>>>>> previous discussion has been lost due to the broken old mailing lists...
>>>>>>>>
>>>>>>>> (...)
>>>>>>>>
>>>>>>>>> +\drivernormative{\subsection}{Device Suspend}{General
>>>>>>>>> +Initialization And Device Operation / Device Suspend}
>>>>>>>>> +
>>>>>>>>> +The driver MUST NOT set SUSPEND if FEATURES_OK is not set or
>>>>>>>> VIRTIO_F_SUSPEND is not negotiated.
>>>>>>>>> +
>>>>>>>>> +Once the driver sets SUSPEND to \field{device status} of the device:
>>>>>>>>> +\begin{itemize}
>>>>>>>>> +\item The driver MUST re-read \field{device status} to verify
>>>>>>>>> +whether the
>>>>>>>> SUSPEND bit is set.
>>>>>>>>> +If not, the device does not support the SUSPEND feature.
>>>>>>>> That sentence is a bit weird: I'd expect the device to not offer
>>>>>>>> VIRTIO_F_SUSPEND in the first place in that case... could this
>>>>>>>> rather happen if the device is not able to handle the request at
>>>>>>>> a specific point in
>>>>>> time?
>>>>>>>>> +\item The driver MUST NOT make any more buffers available to
>>>>>>>>> +the
>>>>>> device.
>>>>>>>>> +\item The driver MUST NOT access any fields of any virtqueues
>>>>>>>>> +or notify
>>>>>>>> any virtqueues.
>>>>>>>>
>>>>>>>> "send notifications for any virtqueues"?
>>>>>>>>
>>>>>>>>> +\item The driver MUST NOT access Device Configuration Space.
>>>>>>>> ...except for the status field, if it is part of the config space?
>>>>>>>>
>>>>>>>>> +\end{itemize}
>>>>>>>>> +
>>>>>>>>> +\devicenormative{\subsection}{Device Suspend}{General
>>>>>>>>> +Initialization And Device Operation / Device Suspend}
>>>>>>>>> +
>>>>>>>>> +The device MUST ignore SUSPEND if FEATURES_OK is not set or
>>>>>>>> VIRTIO_F_SUSPEND is not negotiated.
>>>>>>>>> +
>>>>>>>>> +The device MUST ignore all access to its Configuration Space
>>>>>>>>> +while suspended, except for \field{device status}.
>>>>>>>> ...if it is part of the configuration space.
>>>>>>>>
>>>>>>>>> +
>>>>>>>>> +A device MUST NOT send any notifications, access any
>>>>>>>>> +virtqueues, or modify any fields in its configuration space while
>> suspended.
>>>>>>>>> +
>>>>>>>>> +If SUSPEND is set in \field{device status}, when the driver
>>>>>>>>> +clears SUSPEND,
>>>>>>>> "subsequently clears SUSPEND"?
>>>>>>>>
>>>>>>>>> +the device MUST either resume normal operation or set
>>>>>>>> DEVICE_NEEDS_RESET.
>>>>>>>>> +
>>>>>>>>> +When the driver sets SUSPEND,
>>>>>>>>> +the device SHOULD perform the following actions before
>>>>>>>>> +presenting
>>>>>>>> SUSPEND bit in the \field{device status}:
>>>>>>>>> +
>>>>>>>>> +\begin{itemize}
>>>>>>>>> +\item Stop processing more buffers of any virtqueues \item Wait
>>>>>>>>> +until all buffers that are being processed have been used.
>>>>>>>>> +\item Send used buffer notifications to the driver.
>>>>>>>>> +\end{itemize}
>>>>>>>> So, is there any opportunity for the device to fail setting SUSPEND?
>>>>>>>> I mean, if the driver is supposed to look whether it sticks,
>>>>>>>> there should be conditions for when the device might clear it again...
>>>>>>>>
>>>>>>> Additionally, a suspend operation usually involves saving things
>>>>>>> to a slow
>>>>>> memory (or media).
>>>>>>> This is because the device implementation wouldn't know when
>>>>>>> exactly the
>>>>>> device will be resumed.
>>>>>>> Few examples, are:
>>>>>>> a. A gpu device with 128MB of video RAM when suspended, QEMU
>> needs
>>>>>> to store this into a (for example) rotating hard disk as 1msec IO latency.
>>>>>>> b. a NIC may need to store its RSS, queues, flow filters
>>>>>>> configuration for
>>>>>> several tens of KBs to some slow memory.
>>>>>>> c. A block device may prefer to complete some IOs to a threshold
>>>>>>> level
>>>>>> instead of maintaining large list of outstanding IOs in some
>>>>>> suspended memory.
>>>>>>> d. May be more in future.
>>>>>>>
>>>>>>> Additionally, suspend operation needs to be synchronized with
>>>>>>> certain data
>>>>>> path hardware engines to suspend DMA operations (read and write
>>>>>> both) which are inflight.
>>>>>>> (without causing DMA errors). Same would apply to the sw backend
>>>>>> implementations too.
>>>>>>> Therefore, the suspend operation that is initiated by the driver,
>>>>>>> should get
>>>>>> the acknowledgement back from the device that it has been suspend.
>>>>>>> Some of the good examples if you prefer to follow, a
>>>>>>> driver<->device
>>>>>> interface needs a suspend register which should behave like below
>>>>>> queue reset register.
>>>>>>> Spec snippet:
>>>>>>> "The device MUST reset the queue when 1 is written to queue_reset.
>>>>>>> The device MUST continue to present
>>>>>>> 1 in queue_reset as long as the queue reset is ongoing. The device
>>>>>>> MUST present 0 in both queue_reset and queue_enable when queue
>>>>>>> reset
>>>>>> has completed."
>>>>>>> At minimum, we need, something implementable like,
>>>>>>>
>>>>>>> The device MUST suspend the device when 1 is written to the
>>>>>> device_suspend_ctlr. The device MUST continue to present 1 in
>>>>>> device_suspend_ctrl as the suspend operation is ongoing in the device.
>>>>>>> The device MUST present 0 in the device_suspend_ctlr register when
>>>>>> device has completely suspended the device.
>>>>>>> The device MUST resume the device when 2 is written to the
>>>>>> device_suspend_ctrl. The device MUST continue to present 2 in the
>>>>>> device_suspend_ctrl as the resume operation may not have yet
>> completed.
>>>>>>> The device MUST present 0 in the device_suspend_ctrl register when
>>>>>>> the
>>>>>> device has completely resumed the device.
>>>>>>> At this point, the driver may resume notifying the device and
>>>>>>> accessing the
>>>>>> configuration space.
>>>>>>> Can you please enhance this part?
>>>>>> Hi Parav
>>>>>>
>>>>>> Yes they are necessary contents and we will address them in the
>>>>>> following patches.
>>>>>>
>>>>> The register polarity is critical.
>>>>> In your reply to Cornelia, you descried that suspend bit cleared in
>>>>> the device
>>>> after driver sets it (until the device is suspended).
>>>>> This is ambiguous behavior of the register. Queue_reset register was
>>>>> like that
>>>> before it was fixed in 1.2.
>>>> once suspended, the driver should not access the configuration space
>>>> except for the device status, so it should not reset any vqs through
>>>> configuration space.
>>> I am not talking about VQ reset at all.
>>> I gave an example of how the VQ reset register polarity works (with was
>> broken like how the proposed suspend bit is broken).
>>> Suspend register needs to work the way the reset register works.
>>> Can you please go through my exact text I replied in the previous email?
>>>
>>> Basically, the bug is:
>>> When driver has initiated the suspend (writing 1), the device continue to
>> respond 0, while suspend is going on.
>>> At this point, just by looking at the device_status register one cannot figure
>> out what is going on in the device.
>>> Is driver initiated suspend is ongoing, or it was never started.
>>> It is ambiguous.
>> From the device perspective, there is only one user: the driver, and the driver
>> sets or clears SUSPEND, it knows the status of the device.
> It does not work elegantly when the hypervisor or other system is looking dealing with this register.
>
> In current proposal, anyone else than the driver looking at the device_status, it is ambiguous.
>
> For example,
> suspend_bit: 0x1 suspended.
> 	     0x0 not suspended or suspend is ongoing. (ambiguous for hypervisor debugging this device)
>
> For device migration, it requires yet another side bit in the device parts.
>
> An elegant and non-ambiguous interface can be,
>
> ctrl_register =	0x0 (a usual default)
> 		0x1, suspend the device
> 		0x2, resume the device.
> status_register =	0x0, (still) running.
> 			0x1, suspended.
>
> With this driver and hypervisor (both) has very clear view of what is going on and what is the status.
> No more ambiguity for anyone.
>
> Please consider pros and cons of both approaches.
The driver "owns" the device, other components access the device configurations through the driver, I am not sure there are other "owners" than the driver.

Thanks
Zhu Lingshan

