Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB21E18EBF
	for <virtio-comment@lists.linux.dev>; Mon, 30 Sep 2024 07:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727680268; cv=fail; b=W5f7jLUmXwNWAGIG2+3sQ/2WOG0Y3sN6kvgtobK9+8Ln/z+k5Cl9RPdg89lqoRRG/Xx7ij1nq1T4kvzFx7NYjlPr+Mk7IOiejAOQZ/nI+K6kMm7oft5cAYrL4MKyYtMVoAY4FWx5HHjQV+r+CzcfvyZZzq5ZMJb5jNtnAN3zjCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727680268; c=relaxed/simple;
	bh=0AxibFo3LTMLbOHc3gyYsI3mcwW51IUjZsDgPfCqRl4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WkrDbtd85BJU80hX4DFuYu/15qYVoyhjp1CDkgTADbmgFSwN5zdnhtK36Aqnqu+fD9pAd/tgDJToA1RdIjOXXa85UdAjPs93MiEI17V9giklqpO1o9kKZ/tOCyXMbtSDWYG8yL3yN1wTPGu91iX9mfS7+19l4RN+QUCEuT5oim4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EYAlzVrR; arc=fail smtp.client-ip=40.107.92.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EYAlzVrR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bu1Oo5zpnznJuXYQ6oULy8f+FS03i5uA7wQUAdE26C281s7APLACVb2p6XMUza+vYZ0JrslEveTkNCkDynSeNwyEOz+rVkK0QZtpIUorRhFYKn7djGJQ0S3WrY9DG1Z+/FWFmvZ2cGscpStcwSOvhXYuEYkKlkLgY2RZW/1EiobKk51bXou3q1BqVYXX2/wkDlAkrZuE1MRYAC+0U7vxq8kdGE1czX+CicFp23VkXLwiH8FdTdw4DVcpABFU2ItL690A0orSJR5qkmTBKndAfrS9PKI2RR6QYdYtEH4eJNzDHRC5o0Z6P3otBhUXa28utOrNnGZYoMZoZACR1sPzcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8sb0RZ9/F65hXGRZY9Ar2Y8nhHLnJLjEwHOI3Y3+hE=;
 b=rCqS76bkHTWZYfbP4G33yWiEqZ+BsKW3nYdglR/Q9xpgSbRND7hOCpyFRdlEIDiGfsJjvFOSMEMLkAfVScfH2gTOSs/bWR0Y/4sHcVl/xUk9XTE2YsqCzbYCiGQS9puISkRkgEaLJJHwqrDwzyS9VsQChLC25w6AxPMMiT1j08vRQmjASvT955mJf+0eJVKlRlArXY4e01Gre9ktMVHIQWWYl0r/MaSJBtX6oQ+P98m/BIHN159uKxkohgXDhCQ0wAXaefxgJfjElEqm7nuPmS/XVC1ycbsSVIU+3/IcgmE88Ywo+VUeaWIeTvQnAFVV7ivOYXgmniEr3FOLPEByzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8sb0RZ9/F65hXGRZY9Ar2Y8nhHLnJLjEwHOI3Y3+hE=;
 b=EYAlzVrR87//GaT+xHCFGedYsIM9iBGiSxgzVlo4hMsoebqLNSOaU0eIP8uA9e+Z2Bvo6nOiqyQxBjAVD1JJUP2k0bfitGf+oBzGX4X+kANrYoS0gmgbZGHWfiw7C644/gUK4WpD9WbCnT7zp1SdDItq8I2fpGKZy8mwHximkpY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 07:11:02 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%6]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 07:11:02 +0000
Message-ID: <030cf387-48ca-40b8-8dab-70f6beb4011a@amd.com>
Date: Mon, 30 Sep 2024 15:10:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] transport-pci: Add MSI support
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
 "mie@igel.co.jp" <mie@igel.co.jp>
References: <20240712140144.12066-1-manivannan.sadhasivam@linaro.org>
 <20240724162143.GH3349@thinkpad> <20240903053218.7lapwvllgz4xk4se@thinkpad>
 <IA0PR12MB8713D97523757F1FDD6D3525DC762@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240930022818-mutt-send-email-mst@kernel.org>
 <8f7a2626-f066-4a49-af09-9b83e95ca0a6@amd.com>
 <IA0PR12MB87138EEE12B3A853C10605AADC762@IA0PR12MB8713.namprd12.prod.outlook.com>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <IA0PR12MB87138EEE12B3A853C10605AADC762@IA0PR12MB8713.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0103.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::16) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|BL1PR12MB5753:EE_
X-MS-Office365-Filtering-Correlation-Id: ba1729d6-1351-4936-012a-08dce11f0b1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eStVVVozbThNRkFia2xPNUttN0tTVGt1V0Fsa2o4RVBDOVM0c3U2ZzF1L2c1?=
 =?utf-8?B?aU1UVzRiTWttN1VRdHRMYmdpMmlJWVFxVDJOZGU2cVlwVStRN2pVcU00T0JV?=
 =?utf-8?B?NWhaNDJNVnRqVGYyaC9TOWpMY1BsejkvUHlxTnlxU2xvUjFQb21WQ3lUTGRy?=
 =?utf-8?B?ZWJkQUk0NldXZEcybVZDajd6UjY3aHdDa21saG1xcHFVT0FnY1F5dUFWVU9l?=
 =?utf-8?B?MWx1QWdpQkRQd1gyR2dRZ1Q0VmNtN1hORlYrVlVUNGhOcXpvd3RSMWxZNG5H?=
 =?utf-8?B?Tm1rYVVWcHd4U09JZm8rMzNST3AydUhBc1FZVCs0WWU4bU9oV0VsWjNESi9i?=
 =?utf-8?B?UEN6WGQvV0hDYkpLbmdrZGgwVEdPai9sOHQ2eDN2d3FuZCtvUFdiSG9XVk4z?=
 =?utf-8?B?VXJrTUVVM3czTmtjZFJFK01HUHF3UnorR0haS0FFYTFTMlVibFZQdklLcFRw?=
 =?utf-8?B?dFNjSmpWekc1eEgybFN5RmM3RFlrRCtSei9NWEkyN1g0dzY3Vm42WWNPcTJj?=
 =?utf-8?B?K1FacTR3QThTVGRDempmYy9OaC9UMG9DMkhIMExJZUhpUkpRQXo2Tm1kQzdW?=
 =?utf-8?B?UGxwSjJZVUg5aTducVV0WkNzOCtwNjlnbUNWb0hEclJHYXduOVNhTUpFaWtC?=
 =?utf-8?B?SkVSeURhK3VNc0Z3VEdQeFlPL1pTb0xlc21yQTg1eEx6QlpxS2t5Y2RQT0F4?=
 =?utf-8?B?RTB5MXBqSHJHTXZmNWgzWnZyUjNwdExxUjFGWk4zZURBbjlQUmJlRzIvTDIw?=
 =?utf-8?B?RTdoVlp0UlFUK0EwR3ZwOENNRmx5bmJrMmg2MU1DMldJYlA0b0JSNXdJM0dI?=
 =?utf-8?B?bHdoa3ovOTJWTm9TMGwrOXJHcTQyS1NITldJajROK3h3bGppNlp1bkJsb3JM?=
 =?utf-8?B?M21vbTFkd0taVlNaK1pjQmk0UEJHY0s4NVJCL2dSRWkvVDNsazBrMDkreDZh?=
 =?utf-8?B?REhIOHYzaGkwMjRNanpKUExSTmc2SURBT2dQdGJqZDc5MWV2WUgvSDB1SW5H?=
 =?utf-8?B?VTJsK3J3cDJBVnk4M1FBekZYTFUxbmVWVFFLak5VQUFoQ0JsaGNQV3ZneTNo?=
 =?utf-8?B?NUdCeU9NZjZEQUplRnVIV0E1UERMU1lWRnlSaVZhMzFoY2hTK3lDLzcvTkVX?=
 =?utf-8?B?QVVPYTdSU1BDN1BpSEpqeEdIeEtTdHJYa1ZnWHA4QlovNGk2b3NUWFRab0Iz?=
 =?utf-8?B?aEZvSHNYcUZGY0w4Z3BRaGhoeVFCMjJQMnJaTS90TkdvbGhWV3hWWmhvazdL?=
 =?utf-8?B?bk1GQS9ZZFNzWGpXMlQzem9jTWcvK1k4MWgvT3I4V3ArMnJ3MjVTemxCa2Jy?=
 =?utf-8?B?Vzg5SkNMWDFFR2dVLyt0S0dZNTJQTDRrRkFNZU0reGpFNTIydTl4MjJMMDBZ?=
 =?utf-8?B?d1BCVkdMWXQwY204SGxhUWhGT2ZQVzZ2aHpXQnpsc2hObk5VeW5JNW4rY1Bv?=
 =?utf-8?B?N2RxWUhCaGVDdjlBSGFxdGV4SnZlWVBLcW5xaTFlK0ExUHIrbXhVVFR3TDBi?=
 =?utf-8?B?eFBkOTRZZEVMWWJISWtLQmorelJ2UmJKT2tNQVVCcWR4emYweDdRTzRJZmFH?=
 =?utf-8?B?NnQ1RjVTVCtLSVJFZTcxMnBzZUJ6TTJ3NUdScXZQV1FUaUZqaGJEQk84VDhK?=
 =?utf-8?B?ZTdiK2M0VTdjVk1lRzZBMitjM0JTUDR3aTZ3ejNGMWwzY3hobTJKZzRMZXFZ?=
 =?utf-8?B?ZWxrTVdFdnVqK3B5MHc5czFTdXlLbWlRWVVlRmh1UDV2NThRN0ZXR2JsOEhU?=
 =?utf-8?B?dDR2NzZOT29lRnVrVHB5RzZJZUViVlhEcUNyM0RXd1g1d09mZGVFUE1MWFB0?=
 =?utf-8?B?cEg5RVhhNzBmb2JNMUgrZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXJOM3NTRVpFUUlQbXkwemc5MkpQQ3VVd0Y5Y1E0VUY3MkM5aXZxZExjdXdt?=
 =?utf-8?B?Q2hTMzByanpKd2tJd0VPUk42YTJzcHhtcjZmTWdzb2Q4Q1QySFlNMktqNTVO?=
 =?utf-8?B?azhmaEVmYjFqTWV1dmFpeVRUMUp3aFlrY253V2Fsa2ZMWVlDUHZyWjZiSTZL?=
 =?utf-8?B?VFlXaVBDWjlvbVgvckduSUt6Z2dtMzljbnE2SEtaYlVaU2dTTXF6S09LKzhG?=
 =?utf-8?B?c1kyLzBJMFc3VVV1Ym9oTWhwbkdQeXlYWXI1aFUzTjZ2R1NkOGNDaHNPc2dJ?=
 =?utf-8?B?WHZOTEhMMURmNzdTRlBrdDJSbThqdzU1RllDQi9JK3JYangxWi9EWkxpQUxN?=
 =?utf-8?B?OTRYUDNPOC9FRHBtMEFrUXZJN0U1Q2JCb2pGSHFjTDFCdDZTb3AyWmlpbDdv?=
 =?utf-8?B?RHBKM2p5MWlCc25mY0hlTTZCa3FhVzV6NHJKNVROYSsrZGVYVzNqVmJ2NFNK?=
 =?utf-8?B?SExNRldNUFMvWDN3ZjU5SEJOMTJlTmhUOVEvNFJibUYxR3h4WFNLMDlMTG4y?=
 =?utf-8?B?eGIxdkhyS3RldE9iMUZUVXloK3REdEFianJCV0dEYjQ1SDdnZG9ra2pROEIx?=
 =?utf-8?B?SWFVYm82ZWpkSjhFekJyTmtrZCtEUWNuMzdsZERLRGRaS0k2dW0yVzdCRU13?=
 =?utf-8?B?aE9QTUJsL3ZlWGFiRkdYeEN2U3lXRml6MFllYVA2aTRyMU5xTU84U3BCb0ww?=
 =?utf-8?B?eURJTXp1UHJkSVNxWnRzaFlzNFJCY0IzdktHbThOT2s1STFhcnFVbU9hVXpM?=
 =?utf-8?B?VzVKVUV0cmtkQWI5TUQvVHh5TkFVQ1ZtUXg0ZTh6dFlWZEdxd0dlQ2FNWFpX?=
 =?utf-8?B?UFlsSlFpUGUwN3JxSCtpUTNFRCtiVDc1Vzc4eVZmTFRYMXQwT0VLdGgrVXFv?=
 =?utf-8?B?bTREWnI0YzZWYWNRVHFNa0Y3NDdERWRwVFJEeTdaY2hvUkhtOHh6bTlLeFFR?=
 =?utf-8?B?bGtVZVdzME1QampWNFdCdHNFdmllcENPaERURmRXaTdZZk5CazlqL0tPQm5I?=
 =?utf-8?B?OVEwcng2MVlMbjVtZ3I3RFhIZnYrdmdORWdsQW1KUzNpYURLSGMvREk5Rmd2?=
 =?utf-8?B?ZGd3YlF3WmM2THZSb0padUpaOTJ1aVhYTEg2T25oczUyVWRSdTZmdmhWVDZz?=
 =?utf-8?B?bkozSUJlRHZna0l3UERtaDVuTS9kT25UdldHUWdlTUZPRmNQWDc2elVsZWJp?=
 =?utf-8?B?b3VMaW5xY0xoZ0FHSmJ3OUxkTHh0UWlycTJick5YbzAyanhrUjUxRDRwWDJy?=
 =?utf-8?B?RlFtVWVGZVdOOEU4QmdIU2k1cmc4anV3U2RNUGRTMWg3TkordDlsQ2dDVG82?=
 =?utf-8?B?Z2QyUmRTRnJvajlzQXl6M0lWMUg0L3lZZEJvR1lGYzg3bG5pbEhsR0ZCYXFO?=
 =?utf-8?B?M3pDNzRXRGFyWldRSXRVY043NEVXMHJCQ3RFd1NRQmFFRFZZQ2FmZlBHSXBk?=
 =?utf-8?B?aHJGbk96bGx6L29NaVk0K2VFVGRxelowZ1o1WG8yN0prdjB0YkJlQVBxNW5L?=
 =?utf-8?B?UHMvV2xzYjJJSUVCc085dC8wTTRTNDhkTy9BalVZaVBneDVEOHN2bnJVZ256?=
 =?utf-8?B?dkg2OVFzbmxBNEZ6M1NEWnhzR0djemZHTm95ei9HZG40VEZDV0ZGT0NKUnpu?=
 =?utf-8?B?U2gxZWRtZWhqUi9lYm1XNFVFZUpRMEtnZkwxb0hvRkpqYThKdWRSRVBDenhj?=
 =?utf-8?B?WmhBbmlqNy9hazIrc21GV0dNWkJmM0xVWWlXRDJLV0d1QUJYVzBOYWZjdjhv?=
 =?utf-8?B?cUtDRWNrYktFSE9zbU1MQ05OQmpCaUhwUjFOQmdWdVFYUUUvLzU4YVB3NVpu?=
 =?utf-8?B?cGtqM0h0aldaLzBGMTlHUDBaQzhGSmFJVm5HT3I5bDZHQUNwZlgwa1R6SDdK?=
 =?utf-8?B?QlNVc2cwTkt2aVhFQWV2MUxSL3ZNaXg1aHdwQnZBMmtuN1NHQk03NU1YWmJs?=
 =?utf-8?B?RUtmQ3R0RGl0SGphRFF4YUN4R0hucmNNaUdFVEhSQTZHRWxBUVRuaFpqMUl2?=
 =?utf-8?B?WWJsQURsT1d6eEtIcXFrRVVxQld5M0Fpbm96QWJDTVVMNkYyRXB2VmNNcnRJ?=
 =?utf-8?B?MmEvZjVhYlI5cllBd0hGOWI3R2ZiTVJEbHhWMEpYd2dmcElRNUFKUmw0aXBU?=
 =?utf-8?Q?SSeIF0fw7c4jM1kH7khn8nBlY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba1729d6-1351-4936-012a-08dce11f0b1c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 07:11:02.8375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lC8lBXkWBe7135yFamTVswkaLPK9V+RDVy65cFxS5w7rWwsHcyHR8zcqtzW5Zsou6G5Vj55y9OjSTYHrM5E5JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5753

On 9/30/2024 3:01 PM, Parav Pandit wrote:
>> From: Zhu Lingshan <lingshan.zhu@amd.com>
>> Sent: Monday, September 30, 2024 12:13 PM
>>
>> On 9/30/2024 2:30 PM, Michael S. Tsirkin wrote:
>>> On Mon, Sep 30, 2024 at 05:45:48AM +0000, Parav Pandit wrote:
>>>>> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>>>> Sent: Tuesday, September 3, 2024 11:02 AM
>>>>>
>>>>> On Wed, Jul 24, 2024 at 09:51:43PM +0530, Manivannan Sadhasivam
>> wrote:
>>>>>> On Fri, Jul 12, 2024 at 07:31:44PM +0530, Manivannan Sadhasivam
>> wrote:
>>>>>>> MSI is the predecessor of MSI-X that allows PCIe devices to send
>>>>>>> interrupts to the host. Compared to MSI-X, MSI supports only a
>>>>>>> maximum of 32 vectors per PCIe function. But MSI has been widely
>>>>>>> supported by the PCIe devices requiring fewer interrupts such as
>>>>> Modems, WLAN cards etc...
>>>>>>> Currently, Virtio spec only documents MSI-X and INTX interrupt
>>>>>>> mechanisms for the PCI transport. So if a Virtio device based on
>>>>>>> PCI transport supports only MSI, then the driver on the guest will
>>>>>>> only use INTX for receiving the interrupts. This is really
>>>>>>> sub-optimal and affects the performance of the device. Because
>>>>>>> with MSI, the device can use one vector per queue (max of 32
>>>>>>> vectors) thus avoiding the overhead associated with a shared INTX
>> vector.
>>>>>>> Hence, add support for MSI to the Virtio PCI transport. MSI
>>>>>>> support is added such a way that it reuses the existing
>>>>>>> infrastructure of MSI-X, like the
>>>>>>> config_msix_vector/queue_msix_vector fields of the Virtio common
>>>>>>> config structure. This makes it easy for the Virtio drivers to add MSI
>> support without any disruptive changes.
>>>>>> Gentle ping!
>>>>>>
>>>>> Ping again. Virtio maintainers, can you please share some feedback?
>>>>>
>>>> Overall looks to me.
>>>> A small comment below on single MSI vector.
>>>>
>>>>
>>>>> - Mani
>>>>>
>>>>>> - Mani
>>>>>>
>>>>>>> Signed-off-by: Manivannan Sadhasivam
>>>>>>> <manivannan.sadhasivam@linaro.org>
>>>>>>> ---
>>>>>>>
>>>>>>> Changes in v2:
>>>>>>>
>>>>>>> * Fixed a spelling mistake in commit message
>>>>>>> * Removed update to legacy interface
>>>>>>> * Used 'MSI vector' consistently
>>>>>>>
>>>>>>>  transport-pci.tex | 115
>>>>>>> ++++++++++++++++++++++++++++++++++++----------
>>>>>>>  1 file changed, 92 insertions(+), 23 deletions(-)
>>>>>>>
>>>>>>> diff --git a/transport-pci.tex b/transport-pci.tex index
>>>>>>> a5c6719..fd92641 100644
>>>>>>> --- a/transport-pci.tex
>>>>>>> +++ b/transport-pci.tex
>>>>>>> @@ -347,7 +347,7 @@ \subsubsection{Common configuration
>> structure
>>>>> layout}\label{sec:Virtio Transport
>>>>>>>          Driver Feature Bits selected by \field{driver_feature_select}.
>>>>>>>
>>>>>>>  \item[\field{config_msix_vector}]
>>>>>>> -        Set by the driver to the MSI-X vector for configuration change
>>>>> notifications.
>>>>>>> +        Set by the driver to the MSI/MSI-X vector for
>>>>>>> + configuration change
>>>>> notifications.
>>>>>>>  \item[\field{num_queues}]
>>>>>>>          The device specifies the maximum number of virtqueues
>>>>>>> supported
>>>>> here.
>>>>>>> @@ -371,7 +371,7 @@ \subsubsection{Common configuration
>> structure
>>>>> layout}\label{sec:Virtio Transport
>>>>>>>          A 0 means the queue is unavailable.
>>>>>>>
>>>>>>>  \item[\field{queue_msix_vector}]
>>>>>>> -        Set by the driver to the MSI-X vector for virtqueue notifications.
>>>>>>> +        Set by the driver to the MSI/MSI-X vector for virtqueue
>>>>> notifications.
>>>>>>>  \item[\field{queue_enable}]
>>>>>>>          The driver uses this to selectively prevent the device
>>>>>>> from executing
>>>>> requests from this virtqueue.
>>>>>>> @@ -631,11 +631,11 @@ \subsubsection{ISR status
>>>>>>> capability}\label{sec:Virtio Transport Options / Virti  in
>>>>>>> \field{ISR status} before sending a device configuration  change
>>>>> notification to the driver.
>>>>>>> -If MSI-X capability is disabled, the device MUST set the Queue
>>>>>>> +If MSI/MSI-X capability is disabled, the device MUST set the
>>>>>>> +Queue
>>>>>>>  Interrupt bit in \field{ISR status} before sending a virtqueue
>>>>>>> notification to the driver.
>>>>>>>
>>>>>>> -If MSI-X capability is disabled, the device MUST set the
>>>>>>> Interrupt Status
>>>>>>> +If MSI/MSI-X capability is disabled, the device MUST set the
>>>>>>> +Interrupt Status
>>>>>>>  bit in the PCI Status register in the PCI Configuration Header of
>>>>>>> the device to the logical OR of all bits in \field{ISR status} of
>>>>>>> the device.  The device then asserts/deasserts INT\#x interrupts
>>>>>>> unless masked @@ -645,7 +645,7 @@ \subsubsection{ISR status
>>>>>>> capability}\label{sec:Virtio Transport Options / Virti
>>>>>>>
>>>>>>>  \drivernormative{\paragraph}{ISR status capability}{Virtio
>>>>>>> Transport Options / Virtio Over PCI Bus / PCI Device Layout / ISR
>>>>>>> status capability}
>>>>>>>
>>>>>>> -If MSI-X capability is enabled, the driver SHOULD NOT access
>>>>>>> +If MSI/MSI-X capability is enabled, the driver SHOULD NOT access
>>>>>>>  \field{ISR status} upon detecting a Queue Interrupt.
>>>>>>>
>>>>>>>  \subsubsection{Device-specific configuration}\label{sec:Virtio
>>>>>>> Transport Options / Virtio Over PCI Bus / PCI Device Layout /
>>>>>>> Device-specific configuration} @@ -1017,7 +1017,7 @@
>>>>>>> \subsubsection{Device Initialization}\label{sec:Virtio Transport
>>>>>>> Options / Virti  \drivernormative{\subparagraph}{MSI-X Vector
>>>>>>> Configuration}{Virtio Transport Options / Virtio Over PCI Bus /
>>>>>>> PCI-specific Initialization And Device Operation / Device
>>>>>>> Initialization / MSI-X Vector Configuration}
>>>>>>>
>>>>>>>  Driver MUST support device with any MSI-X Table Size 0 to 0x7FF.
>>>>>>> -Driver MAY fall back on using INT\#x interrupts for a device
>>>>>>> +Driver MAY fall back on using MSI or INT\#x interrupts for a
>>>>>>> +device
>>>>>>>  which only supports one MSI-X vector (MSI-X Table Size = 0).
>>>>>>>
>>>>>>>  Driver MAY interpret the Table Size as a hint from the device @@
>>>>>>> -1034,6 +1034,75 @@ \subsubsection{Device
>>>>>>> Initialization}\label{sec:Virtio Transport Options / Virti  the
>>>>>>> driver MAY retry mapping with fewer vectors, disable MSI-X  or
>>>>>>> report
>>>>> device failure.
>>>>>>> +\paragraph{MSI Vector Configuration}\label{sec:Virtio Transport
>>>>>>> +Options / Virtio Over PCI Bus / PCI-specific Initialization And
>>>>>>> +Device Operation / Device Initialization / MSI Vector
>>>>>>> +Configuration}
>>>>>>> +
>>>>>>> +When MSI capability is present and enabled in the device (through
>>>>>>> +standard PCI configuration space) \field{config_msix_vector} and
>>>>>>> +\field{queue_msix_vector} are used to map configuration change
>>>>>>> +and
>>>>> queue interrupts to MSI vectors. In this case, the ISR Status is unused.
>>>>>>> +
>>>>>>> +Writing a valid MSI vector, 0 to 0x1F, to
>>>>>>> +\field{config_msix_vector}/\field{queue_msix_vector} maps
>>>>>>> +interrupts triggered by the configuration change/selected queue
>>>>>>> +events respectively to the corresponding MSI vector. To disable
>>>>>>> +interrupts for an event type, the driver unmaps this event by
>>>>>>> +writing a special NO_VECTOR
>>>>>>> +value:
>>>>>>> +
>>>>>>> +\begin{lstlisting}
>>>>>>> +/* Vector value used to disable MSI for queue */
>>>>>>> +#define VIRTIO_MSI_NO_VECTOR            0xffff
>>>>>>> +\end{lstlisting}
>>>>>>> +
>>>>>>> +Note that mapping an event to vector might require device to
>>>>>>> +allocate internal device resources, and thus could fail.
>>>>>>> +
>>>>>>> +\devicenormative{\subparagraph}{MSI Vector Configuration}{Virtio
>>>>>>> +Transport Options / Virtio Over PCI Bus / PCI-specific
>>>>>>> +Initialization And Device Operation / Device Initialization / MSI
>>>>>>> +Vector Configuration}
>>>>>>> +
>>>>>>> +A device that has an MSI capability SHOULD support at least 2 and
>>>>>>> +at most 0x20 MSI vectors.
>>>>>>> +Device MUST report the number of vectors supported in
>>>>>>> +\field{Multiple Message Capable} field in the MSI Capability as
>>>>>>> +specified in \hyperref[intro:PCI]{[PCI]}.
>>>>>>> +The device SHOULD restrict the reported MSI Multiple Message
>>>>>>> +Capable field to a value that might benefit system performance.
>>>>>>> +\begin{note}
>>>>>>> +For example, a device which does not expect to send interrupts at
>>>>>>> +a high rate might only specify 2 MSI vectors.
>>>>>>> +\end{note}
>>>>>>> +Device MUST support mapping any event type to any valid vector 0
>>>>>>> +to number of MSI vectors specified in \field{Multiple Message
>>>>>>> +Capable}
>>>>> field.
>>>>>>> +Device MUST support unmapping any event type.
>>>>>>> +
>>>>>>> +The device MUST return vector mapped to a given event, (NO_VECTOR
>>>>>>> +if unmapped) on read of
>>>>> \field{config_msix_vector}/\field{queue_msix_vector}.
>>>>>>> +The device MUST have all queue and configuration change events
>>>>>>> +unmapped upon reset.
>>>>>>> +
>>>>>>> +Devices SHOULD NOT cause mapping an event to vector to fail
>>>>>>> +unless it is impossible for the device to satisfy the mapping request.
>>>>>>> +Devices MUST report mapping failures by returning the NO_VECTOR
>>>>>>> +value when the relevant
>>>>>>> +\field{config_msix_vector}/\field{queue_msix_vector} field is read.
>>>>>>> +
>>>>>>> +\drivernormative{\subparagraph}{MSI Vector Configuration}{Virtio
>>>>>>> +Transport Options / Virtio Over PCI Bus / PCI-specific
>>>>>>> +Initialization And Device Operation / Device Initialization / MSI
>>>>>>> +Vector Configuration}
>>>>>>> +
>>>>>>> +Driver MUST support device with any MSI vector from 0 to 0x1F.
>>>>>>> +Driver MAY fall back on using INT\#x interrupts for a device
>>>>>>> +which only supports one MSI vector (MSI Multiple Message Capable =
>> 0).
>>>>>>> +
>>>> A single MSI (and MSI-X) vector is still far more optimal than INTx due to
>> the inefficiency of the INTx delivery on PCIe transport.
>>> And lack of support on VFs.
>>>
>>>> And for sw based devices, it anyway doesnt matter a lot either.
>>>>
>>>> So when a new functionality like MSI is added, it does not need to continue
>> what MSI-X has done.
>>>> So I request you to remove this guidance of INTx fallback on single MSI
>> vector.
>>> Let's provide an alternative guidance then.
>>> Device SHOULD implement at least 2 MSI vectors?
>> I think one MSI vector is enough for functionalities, just shared by all
>> interrupts.
>>
> Functionally MSI vector can work sub-optimally, because now on every VQ notification, the driver will inspect configuration space to discover changes, generating more unwanted PCI traffic.
when the device notifies the driver, the driver needs to read the vq avail / used index.
But the driver doesn't need to examine all config space when receive vq_notifications, the config space changes are reported through config interrupt.
> So, 2 seems a more practical tradeoff across functionality / performance / scale.
> And single MSI vector instead of INTx is of course a good recommendation by itself to include as independent line.
It should be a minimal requirement, not for optimization
>
>> Thanks
>> Zhu Lingshan
>>>> Rest all looks fine to me.

